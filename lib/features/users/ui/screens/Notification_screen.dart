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

class NotificationScreen extends StatelessWidget {
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
                    SPHelper.spHelper
                        .setCountNotification(myNotification.length);
                    return ListView.builder(
                      itemCount: myNotification.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              margin: EdgeInsets.only(bottom: 20),
                              height: ScreenUtil().setHeight(150),
                              width: ScreenUtil().setWidth(330),
                              decoration: BoxDecoration(
                                  borderRadius: borderRadius8,
                                  color: pinkColor,
                                  boxShadow: <BoxShadow>[boxShadow6]),
                              child: Center(
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
                              )),
                            ),
                            Transform.translate(
                                offset: Offset(15, -20),
                                child: SvgPicture.asset(
                                  lighticon,
                                  fit: BoxFit.fill,
                                ))
                          ],
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
