import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:pythagoras/animate_do.dart';
import 'package:pythagoras/features/users/ui/screens/payment_screen.dart';
import 'package:pythagoras/features/users/ui/screens/webViewPayment.dart';
import 'package:pythagoras/features/users/ui/widgets/custom_Text_Field.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/constants.dart';
import 'package:pythagoras/values/styles.dart';

class CardPaymentDialog extends StatefulWidget {
  @override
  _CardPaymentDialogState createState() => _CardPaymentDialogState();
}

class _CardPaymentDialogState extends State<CardPaymentDialog> {
  int selectedValu = 0;

  setValu(int value) {
    selectedValu = value;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      animate: true,
      duration: Duration(milliseconds: 1000),
      child: Dialog(
        backgroundColor: pinkColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius8,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: ScreenUtil().setHeight(350),
            width: ScreenUtil().setWidth(327),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: ScreenUtil().setHeight(160),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          margin: EdgeInsets.only(top: 25),
                          //   alignment: Alignment.centerRight,

                          height: ScreenUtil().setHeight(102),
                          width: ScreenUtil().setWidth(150),
                          decoration: BoxDecoration(
                              borderRadius: borderRadius8, color: whiteColor),
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 20),
                                  alignment: Alignment.centerRight,
                                  height: ScreenUtil().setHeight(50),
                                  width: ScreenUtil().setWidth(90),
                                  child: Text(
                                    "الصف الخامس الابتدائي",
                                    textAlign: TextAlign.center,
                                    style: styleTitleDialog,
                                  )),
                              SizedBox(height: ScreenUtil().setHeight(10)),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "طالب مسجل 20.000",
                                      style: styleSubTitleCardClasses.copyWith(
                                          color: pinkColor),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Transform.translate(
                      //   offset: Offset(-140, 85),
                      //   child: CircleAvatar(
                      //     backgroundColor: pinkColor,
                      //   ),
                      // ),
                      // Transform.translate(
                      //     offset: Offset(-110, -25),
                      //     child: Text(
                      //       "5",
                      //       style: styleNumberDialog,
                      //     )),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: ScreenUtil().setHeight(50),
                      child: Text(
                        "يرجي شراء الوحدة او المنهج\n للاستمرار",
                        textAlign: TextAlign.center,
                        style: styleSubDialog,
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        height: ScreenUtil().setHeight(25),
                        child: ListTile(
                          leading: Radio(
                            activeColor: whiteColor,
                            value: 0,
                            groupValue: selectedValu,
                            onChanged: (value) {
                              setValu(value);
                            },
                          ),
                          title: Text(
                            "شراء الوحدة الاولي",
                            style: styleSubDialog.copyWith(fontSize: 14),
                          ),
                          trailing: Text(
                            "(200 ريال)",
                            style: styleSubDialogLight,
                          ),
                        ),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        height: ScreenUtil().setHeight(25),
                        child: ListTile(
                          leading: Radio(
                            activeColor: whiteColor,
                            value: 1,
                            groupValue: selectedValu,
                            onChanged: (value) {
                              setValu(value);
                            },
                          ),
                          title: Text(
                            "شراء الوحدة الاولي",
                            style: styleSubDialog.copyWith(fontSize: 14),
                          ),
                          trailing: Text(
                            "(200 ريال)",
                            style: styleSubDialogLight,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: ScreenUtil().setHeight(37),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                                                      child: Container(
                              height: ScreenUtil().setHeight(35),
                              width: ScreenUtil().setWidth(130),
                              decoration: BoxDecoration(
                                  color: whiteColor, borderRadius: borderRadius8),
                              child: Center(
                                child: Text(
                                  "الغاء",
                                  style: styleTitleDialog,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              push(context, WebViewPayment());
                            },
                            child: Container(
                              height: ScreenUtil().setHeight(35),
                              width: ScreenUtil().setWidth(130),
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: borderRadius8),
                              child: Center(
                                child: Text(
                                  "استمرار",
                                  style: styleTitleDialog,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        //this right here
      ),
    );
  }
}
