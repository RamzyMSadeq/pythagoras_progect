import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pythagoras/animate_do.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/features/users/ui/screens/classes_details.dart';
import 'package:pythagoras/features/users/ui/widgets/card_classes_years.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/constants.dart';
import 'package:pythagoras/values/images_name.dart';
import 'package:pythagoras/values/styles.dart';

class ClassesYears extends StatelessWidget {
  String level;
  ClassesYears({this.level});

  isBob(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(LevelsEvent());
    return true;
  }

  @override
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
               // push(context, Sook());
              })
        ],
        leading: Icon(Icons.share),
        backgroundColor: pinkColor,
        title: Column(
          children: [
            Image.asset(
              'assets/images/qwd.png',
              fit: BoxFit.fill,
              height: 30,
            ),
            Text("متعة تعلم الرياضيات", style: styleSubLogoLight),
          ],
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return isBob(context);
        },
        child: Container(
          margin: EdgeInsets.all(30),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "اختر الفصل الدراسي",
                style: styleClassesYears,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              SlideInLeft(
                animate: true,
                duration: Duration(milliseconds: 1000),
                child: InkWell(
                  onTap: () {
                    push(
                        context,
                        ClassesDetails(
                          level: level,
                          term: "1",
                        ));
                    BlocProvider.of<UserBloc>(context)
                        .add(UnitEvent("1", level));
                  },
                  child: CardClassesYears(
                    number: "01",
                    title: "الفصل الدراسي الأول",
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              SlideInRight(
                animate: true,
                duration: Duration(milliseconds: 1000),
                child: InkWell(
                  onTap: () {
                    push(
                        context,
                        ClassesDetails(
                          level: level,
                          term: "2",
                        ));
                    BlocProvider.of<UserBloc>(context)
                        .add(UnitEvent("2", level));
                  },
                  child: CardClassesYears(
                    number: "02",
                    title: "الفصل الدراسي الثاني",
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(70),
              ),
              Container(
                height: ScreenUtil().setHeight(252),
                width: ScreenUtil().setWidth(352),
                child: SvgPicture.asset(
                  classes,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Text(
                "متعة تعلم الرياضيات",
                style: styleTitleButClassesYears,
              )
            ],
          ),
        ),
      ),
    );
  }
}
