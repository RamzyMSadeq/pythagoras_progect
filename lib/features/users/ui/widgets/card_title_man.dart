import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pythagoras/values/images_name.dart';
import 'package:pythagoras/values/styles.dart';

class CardTitleMan extends StatelessWidget {
  String title;
  String subTitle1;
  String subTitle2;
  Color color;

  CardTitleMan({this.title, this.subTitle1, this.subTitle2, this.color});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
            height: ScreenUtil().setHeight(220),
            width: ScreenUtil().setWidth(343),
            child: SvgPicture.asset(
              mancontainer,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(100),
              right: ScreenUtil().setWidth(20),
              top: ScreenUtil().setHeight(10),
              bottom: ScreenUtil().setHeight(10),
            ),
            height: ScreenUtil().setHeight(190),
            width: ScreenUtil().setWidth(335),
            // decoration: BoxDecoration(borderRadius: borderRadius8, color: color),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),

                Text(title,
                    style: styleTitlePayment, textDirection: TextDirection.rtl),
                // Text(
                //   title,
                //   textDirection: TextDirection.rtl,
                //   style: styleSubTitlePayment,
                // ),
                Divider(
                  thickness: 2,
                  color: Colors.blue[700],
                ),
                Text(
                  subTitle2,
                  textDirection: TextDirection.rtl,
                  style: styleSubTitlePayment.copyWith(fontSize: 9),
                ),
              ],
            ),
          ),
          // Transform.translate(
          //   offset: Offset(0, ScreenUtil().setHeight(-25)),
          //             child: Container(
          //     margin: EdgeInsets.only(
          //       right: ScreenUtil().setWidth(220),

          //       ),
          //     height: ScreenUtil().setHeight(220),
          //     width:ScreenUtil().setWidth(117) ,
          //     child: Image.asset(
          //       man2,
          //       fit: BoxFit.fill,
          //       height: ScreenUtil().setHeight(195),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
