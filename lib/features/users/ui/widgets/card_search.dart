import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pythagoras/components/models/video.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/shadows.dart';
import 'package:pythagoras/values/styles.dart';

class CardSearch extends StatelessWidget {
  VideoData myVideo;
  CardSearch({this.myVideo});
  @override
  Widget build(BuildContext context) {
    return myVideo != null || myVideo != ""
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            height: ScreenUtil().setHeight(115),
            width: ScreenUtil().setWidth(350),
            decoration: BoxDecoration(
                color: pinkColor,
                borderRadius: borderRadius8,
                boxShadow: <BoxShadow>[boxShadow6]),
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  height: ScreenUtil().setHeight(90),
                  width: ScreenUtil().setWidth(82),
                  decoration: BoxDecoration(
                      borderRadius: borderRadius8, 
                      color: hintColor,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(myVideo.thumbnail != null && myVideo.thumbnail != '' ? myVideo.thumbnail : "https://i.guim.co.uk/img/media/1f88ae6599ec098c9c0e4556c68a95f01fd314fc/0_273_4287_2572/master/4287.jpg" ),
                      
                      fit: BoxFit.fill)
                      ),
                  child: Center(
                    child: Icon(
                      Icons.play_circle_filled,
                      color: whiteColor,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(155),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الخامس الابتدائي",
                        style: styleTitleDetails.copyWith(color: whiteColor),
                      ),
                      Text(
                        myVideo.title,
                        style: styleSubTitleDetails.copyWith(color: whiteColor),
                      ),
                      Text(
                        "ستتعلم كيفية حساب المثلث و كيفية حساب الضلع الغير معلوم",
                        style: styleSubTitleDetails.copyWith(
                            fontSize: 9, color: whiteColor),
                      )
                    ],
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(80),
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ساعة 25",
                        style: styleTitleDetails.copyWith(
                            fontSize: 10, color: whiteColor),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            size: 12,
                            color: hintColor,
                          ),
                          Text(
                            "شوهد بواسطة 2.050 طالب",
                            style: styleSubTitleDetails.copyWith(
                                fontSize: 6, color: whiteColor),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        : Center(
            child: Text("No Video"),
          );
  }
}
