import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:pythagoras/components/models/levels.dart';
import 'package:pythagoras/features/users/ui/screens/Notification_screen.dart';
import 'package:pythagoras/features/users/ui/screens/classes_years.dart';
import 'package:pythagoras/features/users/ui/screens/live_screen.dart';
import 'package:pythagoras/features/users/ui/screens/setting_screen.dart';
import 'package:pythagoras/features/users/ui/widgets/card_clasess.dart';
import 'package:pythagoras/features/users/ui/widgets/card_search.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/constants.dart';
import 'package:pythagoras/values/images_name.dart';
import 'package:pythagoras/values/styles.dart';

class ClassesScreen extends StatefulWidget {
  @override
  _ClassesScreenState createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(LevelsEvent());
    super.initState();
  }

  @override
  String search = "";
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                size: 25,
                color: whiteColor,
              ),
              onPressed: () {
                push(context, NotificationScreen());
              })
        ],
        leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(MeUserEvent());
              push(context, SettingScreen());
            }),
        backgroundColor: orangeColor,
        title: Column(
          children: [
            // SvgPicture.asset(
            //   title,
            //   fit: BoxFit.fill,
            // ),
            Image.asset(
              titlepng,
              fit: BoxFit.fill,
            ),
            Text("متعة تعلم الرياضيات", style: styleSubLogoLight),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(50),
            width: double.infinity,
            decoration:
                BoxDecoration(color: orangeColor, boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 6,
                  color: blackColor.withOpacity(.16),
                  offset: Offset(0, 3))
            ]),
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                  vertical: ScreenUtil().setHeight(6)),
              height: ScreenUtil().setHeight(45),
              width: ScreenUtil().setWidth(315),
              decoration: BoxDecoration(
                  borderRadius: borderRadius22, color: whiteColor),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  onChanged: (value) {
                    search = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 2),
                      border: InputBorder.none,
                      hintText: "بحث",
                      hintStyle: styleTextFieldLogIn,
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
            ),
          ),
          search == null || search == ""
              ? Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  height: ScreenUtil().setHeight(665),
                  width: double.infinity,
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
                      } else if (state is LevelsState) {
                        List<LevelsData> dataLevels = state.data;

                        return ListView.builder(
                          itemCount: dataLevels.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                    onTap: () {
                                      push(
                                          context,
                                          ClassesYears(
                                            level:
                                                dataLevels[index].id.toString(),
                                          ));
                                    },
                                    child:
                                        // Container(
                                        //   height: ScreenUtil().setHeight(250),
                                        //   width: ScreenUtil().setWidth(350),
                                        //   child: SvgPicture.asset(container5,fit: BoxFit.fill,),
                                        // )

                                        CardClasess(
                                      index: index,
                                      dataLevel: dataLevels.reversed.toList(),
                                    )),
                                // SizedBox(
                                //   height: ScreenUtil().setHeight(10),
                                // )
                              ],
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                )
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    height: ScreenUtil().setHeight(665),
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return CardSearch();
                      },
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
