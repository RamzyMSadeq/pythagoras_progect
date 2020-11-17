import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pythagoras/components/models/video.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/styles.dart';

class CardWatch extends StatelessWidget {
  VideoData videoData;
  int index;

  CardWatch({this.videoData, this.index});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: ScreenUtil().setHeight(125),
        width: double.infinity,
        color: whiteColor,
        child: Row(
         // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                index <= 9 ? "0${index + 1}" : "${index + 1}",
                style: styleNumberWatch,
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(84),
              width: ScreenUtil().setWidth(117),
              decoration: BoxDecoration(
                  borderRadius: borderRadius5,
                  color: hintColor,
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(videoData.thumbnail),
                      fit: BoxFit.fill)),
              // child: Center(
              //   child: Icon(
              //     Icons.play_circle_filled,
              //     color: whiteColor,
              //     size: 35,
              //   ),
              // ),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              width: ScreenUtil().setWidth(220),
              //color: pinkColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: ScreenUtil().setHeight(20),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                    "الدرس ${index+1}",
                    style: styleTitleDetails.copyWith(fontSize: 12),
                  ),

                      Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [Icon(Icons.fiber_new), Text(videoData.status)],
                    )),
                    ],
                  ),
                  
                  Text(
                    videoData.title,
                    style: styleTitleAppBarYears.copyWith(
                      fontSize: 13,
                      color: deepGreenColor),
                  ),
                  Text(
                    "40 دقيقه",
                    style: styleTimeWatch,
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}