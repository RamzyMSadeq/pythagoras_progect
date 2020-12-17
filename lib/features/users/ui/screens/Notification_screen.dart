import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:pythagoras/components/models/notification_model.dart';
import 'package:pythagoras/services/sp_helper.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/images_name.dart';
import 'package:pythagoras/values/shadows.dart';
import 'package:pythagoras/values/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationScreen extends StatelessWidget {
  String levelId;
  NotificationScreen({this.levelId});
  isBob(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(LevelsEvent());
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return isBob(context);
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: whiteColor,
            appBar: AppBar(
              title: Text(
                "الاشعارات",
                style: styleTitlePayment,
              ),
              backgroundColor: orangeColor,
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: BlocBuilder<UserBloc, BlocStates>(
                builder: (context, state) {
                  if (state is TasksLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is EmptyTasksState) {
                    return Center(
                      child: Text('Empty Tasks'),
                    );
                  } else if (state is TasksErrorState) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is NotificationState) {
                    Notification1 notification = state.notification1;
                    List<DataNotification> myNotification = notification.data;

                    //  levelId == "0"
                    //     ? notification.data
                    //         .where((element) => element.levelId == 0)
                    //         .toList()
                    //     : levelId == "1"
                    //         ? notification.data
                    //             .where((element) => element.levelId == 1)
                    //             .toList()
                    //         : levelId == "2"
                    //             ? notification.data
                    //                 .where((element) => element.levelId == 2)
                    //                 .toList()
                    //             : levelId == "3"
                    //                 ? notification.data
                    //                     .where(
                    //                         (element) => element.levelId == 3)
                    //                     .toList()
                    //                 : levelId == "4"
                    //                     ? notification.data
                    //                         .where((element) =>
                    //                             element.levelId == 4)
                    //                         .toList()
                    //                     : levelId == "5"
                    //                         ? notification.data
                    //                             .where((element) =>
                    //                                 element.levelId == 5)
                    //                             .toList()
                    //                         : levelId == "6"
                    //                             ? notification.data
                    //                                 .where((element) =>
                    //                                     element.levelId == 6)
                    //                                 .toList()
                    //                             : levelId == "7"
                    //                                 ? notification.data
                    //                                     .where((element) =>
                    //                                         element.levelId ==
                    //                                         7)
                    //                                     .toList()
                    //                                 : levelId == "8"
                    //                                     ? notification.data
                    //                                         .where((element) =>
                    //                                             element
                    //                                                 .levelId ==
                    //                                             8)
                    //                                         .toList()
                    //                                     : notification.data
                    //                                         .where((element) =>
                    //                                             element
                    //                                                 .levelId ==
                    //                                             0)
                    //                                         .toList();

                    SPHelper.spHelper
                        .setCountNotification(myNotification.length);
                    return ListView.builder(
                      itemCount: myNotification.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: ()async{
                            if(myNotification[index].link != null || myNotification[index].link != ""){
                               var url ="${myNotification[index].link}";
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                            }
                          },
                                                  child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                margin: EdgeInsets.only(bottom: 20),
                                height: ScreenUtil().setHeight(120),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: borderRadius8,
                                    color: pinkColor,
                                    boxShadow: <BoxShadow>[boxShadow6]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      
                                      myNotification[index].description,
                                      style: styleNotificationTitle,
                                    ),
                                    Text(
                                      myNotification[index].createdAt,
                                      style: styleNotificationSubTitle,
                                    )
                                  ],
                                ),
                              ),
                              Transform.translate(
                                  offset: Offset(15, -20),
                                  child: SvgPicture.asset(
                                    lighticon,
                                    fit: BoxFit.fill,
                                  ))
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            )),
      ),
    );
  }
}
