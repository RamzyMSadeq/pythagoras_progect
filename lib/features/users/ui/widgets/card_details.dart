import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pythagoras/components/models/unit.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/shadows.dart';
import 'package:pythagoras/values/styles.dart';

class CardDetails extends StatelessWidget {
  final unitdata;
  Color color;
  int index;
  CardDetails({this.unitdata, this.color, this.index});

  @override
  Widget build(BuildContext context) {
    print("1111111111111111111111111111111111111111111111111111");
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      //height: ScreenUtil().setHeight(105),
      width: ScreenUtil().setWidth(350),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: borderRadius8,
          boxShadow: <BoxShadow>[boxShadow6]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: ScreenUtil().setHeight(90),
            width: ScreenUtil().setWidth(91),
            decoration:
                BoxDecoration(borderRadius: borderRadius8, color: color),
            child: Center(
              child: Text(
                "${index + 1}",
                style: styleNumberDetails,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            alignment: Alignment.centerRight,
            width: ScreenUtil().setWidth(250),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unitdata.title,
                  style: styleTitleDetails,
                ),
                Text(
                  unitdata.description == null
                      ? "لا يوجد وصف"
                      : unitdata.description,
                  style: styleSubTitleDetails,
                ),
                // Text(
                //   "ستتعلم كيفية حساب المثلث و كيفية حساب الضلع الغير معلوم",
                //   style: styleSubTitleDetails.copyWith(fontSize: 9),
                // )
              ],
            ),
          ),
          // Container(
          //   height: ScreenUtil().setHeight(80),
          //   padding: EdgeInsets.only(left: 10),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "25",
          //         style: styleTitleDetails.copyWith(fontSize: 10, color: color),
          //       ),
          //       Row(
          //         children: [
          //           Icon(
          //             Icons.remove_red_eye,
          //             size: 12,
          //             color: hintColor,
          //           ),
          //           Text(
          //             "شوهد بواسطة 2.050 طالب",
          //             style: styleSubTitleDetails.copyWith(fontSize: 6),
          //           )
          //         ],
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
