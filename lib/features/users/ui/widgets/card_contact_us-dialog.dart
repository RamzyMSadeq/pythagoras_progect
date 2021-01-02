import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/features/users/ui/screens/verification_phone_screen.dart';
import 'package:pythagoras/features/users/ui/widgets/custom_Text_Field.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/constants.dart';
import 'package:pythagoras/values/images_name.dart';
import 'package:pythagoras/values/styles.dart';

class CardContactUsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius8),
      child: Container(
        height: ScreenUtil().setHeight(300),
        width: ScreenUtil().setWidth(327),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              homeimage,
              fit: BoxFit.fill,
              width: 190,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "هل أنت معلم وتود الإنضمام لنا  ؟",
                  style: styleSubTitleBlue,
                )),

            //                Container(
            //                 width: ScreenUtil().setWidth(237),

            //                 child: CustomTextField(
            //                   hintTitle: "الأسم",
            //                   icon:Icon(
            //   Icons.person,
            //   size: 20,
            // ) ,
            //                 )

            //               ),
            //                 Container(
            //                 width: ScreenUtil().setWidth(237),

            //                 child: CustomTextField(
            //                   hintTitle: "رقم الهاتف",
            //                   icon:Icon(
            //   Icons.phone,
            //   size: 20,
            // ) ,
            //                 )

            //               ),

            Divider(
              thickness: 2,
            ),

            Container(
              width: ScreenUtil().setWidth(250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      BlocProvider.of<UserBloc>(context)
                          .add(CallMeEvent(context));
                           BlocProvider.of<UserBloc>(context).add(MeUserEvent());
                         Navigator.of(context).pop();
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(36),
                      width: ScreenUtil().setWidth(100),
                      decoration: BoxDecoration(
                          color: orangeColor, borderRadius: borderRadius8),
                      child: Center(
                        child: Text(
                          "نعم",
                          style: styleTitleDialog.copyWith(color: whiteColor),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(36),
                      width: ScreenUtil().setWidth(100),
                      decoration: BoxDecoration(
                          color: orangeColor, borderRadius: borderRadius8),
                      child: Center(
                        child: Text(
                          "لا",
                          style: styleTitleDialog.copyWith(color: whiteColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      //this right here
    );
  }
}
