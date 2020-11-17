import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pythagoras/features/users/ui/widgets/card_title_man.dart';
import 'package:pythagoras/features/users/ui/widgets/custom_text_field_payment.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/images_name.dart';
import 'package:pythagoras/values/styles.dart';
import 'package:video_player/video_player.dart';

class PaymenyScreen extends StatefulWidget {
  @override
  _PaymenyScreenState createState() => _PaymenyScreenState();
}

class _PaymenyScreenState extends State<PaymenyScreen> {
  VideoPlayerController controller;
  Future<void> initializeVideo;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        // actions: [
        //   IconButton(
        //       icon: Icon(
        //         Icons.arrow_forward,
        //         size: 25,
        //         color: whiteColor,
        //       ),
        //       onPressed: () {})
        // ],
       
        backgroundColor: pinkColor,
        title: Column(
          children: [
            Text(
              "الصف الخامس الابتدائي",
              style: styleTitleAppBarYears,
            ),
            Text("الفصل الدراسي الأول ",
                style: styleTitleAppBarYears.copyWith(fontSize: 10)),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(30),

            ),
            CardTitleMan(
              title: "الدروس المسجلة",
              subTitle1: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد ",
              subTitle2: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد ",
              color:blueColor
            ),

            // SizedBox(height: ScreenUtil().setHeight(5)),

             Directionality(
               textDirection: TextDirection.rtl,
                            child: Container(
                 padding: EdgeInsets.all(20),
                  height: ScreenUtil().setHeight(320),
                //  color: Colors.amber,
                    width: double.infinity,
                    child: Form(
                      child: Column(
                        children: [
                          CustomTextFiledPayment(
                            title: "اسم حامل البطاقة",
                          ),
                           SizedBox(height: ScreenUtil().setHeight(5)),
                           CustomTextFiledPayment(
                            title: "رقم البطاقة",
                          ),
                           SizedBox(height: ScreenUtil().setHeight(5)),
                          Container(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Container(
                                   width: ScreenUtil().setWidth(150),
                                   child: CustomTextFiledPayment(
                              title: "تاريخ الاتهاء",
                            ),
                                 ),
                            
                             Container(
                                  width: ScreenUtil().setWidth(150),
                               child: CustomTextFiledPayment(
                                title: "الرقم السري",
                            ),
                             ),
                                
                              ],
                            ),
                          ),
                            SizedBox(height: ScreenUtil().setHeight(20)),

                          Container(
                          height: ScreenUtil().setHeight(36),
                          width: ScreenUtil().setWidth(130),
                          decoration: BoxDecoration(
                              color: pinkColor, borderRadius: borderRadius8),
                          child: Center(
                            child: Text(
                              "شراء",
                              style: styleTitleDialog.copyWith(
                                color: whiteColor
                              ),
                            ),
                          ),
                        ),

                        Container(
                            height: ScreenUtil().setHeight(35),
                          child: Text("(200 ريال)",style: stylePaymentPrice,)),
                       


                        ],
                      )),
               ),
             ),
              Container(
                height: ScreenUtil().setHeight(140),
                width: double.infinity,
                child: Image.asset(paymentbottom2,fit: BoxFit.fill,))
            
          ],
        ),
      ),
    );
  }
}
