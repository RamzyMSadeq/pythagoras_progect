import 'package:flutter/material.dart';

class MediaRamzy extends StatefulWidget {
  @override
  _MediaRamzyState createState() => _MediaRamzyState();
}

getWidthMedia(BuildContext context, int width) {
  return MediaQuery.of(context).size.width * (width / 375);
}

getHeightMedia(BuildContext context, int height) {
  return MediaQuery.of(context).size.height * (height / 812);
}

class _MediaRamzyState extends State<MediaRamzy> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          //  SizedBox(
          //   height: getHeightMedia(context, 100),
          // ),
          Container(
            height: getHeightMedia(context, 212),
            width: getWidthMedia(context, 375),
            color: Colors.red,
          ),
          Container(
            height: getHeightMedia(context, 300),
            width: getWidthMedia(context, 375),
            color: Colors.blue,
          ),
          Container(
            height: getHeightMedia(context, 300),
            width: getWidthMedia(context, 375),
            color: Colors.green,
          ),

          // SizedBox(
          //   height: getHeightMedia(context, 100),
          // ),
          // Container(
          //   height: getHeightMedia(context, 300),
          //   width: getWidthMedia(context, 100),
          //   color: Colors.blue,
          // ),


        ],
      )
      
    );
  }
}