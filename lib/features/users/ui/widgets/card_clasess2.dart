// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screenutil.dart';
// import 'package:pythagoras/animate_do.dart';
// import 'package:pythagoras/components/models/levels.dart';
// import 'package:pythagoras/values/borders.dart';
// import 'package:pythagoras/values/colors.dart';
// import 'package:pythagoras/values/shadows.dart';
// import 'package:pythagoras/values/styles.dart';

// class CardClasess2 extends StatelessWidget {
//   int index;
//   List<LevelsData> dataLevel;
//   CardClasess2({this.index , this.dataLevel});
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: SlideInUp(
//         animate: true,
//         duration: Duration(milliseconds: 1000),
//         child: Container(
//           height: ScreenUtil().setHeight(165),
//           width: double.infinity,
//           child: Stack(
//             children: [
//               Container(
//                 padding: EdgeInsets.only(
//                     left: index == 5 || index == 6 || index == 7
//                         ? ScreenUtil().setWidth(80)
//                         : ScreenUtil().setWidth(1)),
//                 margin: EdgeInsets.only(
//                   left: ScreenUtil().setWidth(21),
//                   top: ScreenUtil().setHeight(3),
//                   bottom: ScreenUtil().setHeight(4),
//                 ),
//                 width: double.infinity,
//                 // index==1
//                 // ?
//                 // ScreenUtil().setWidth(330)
//                 // :
//                 // index==2
//                 // ?
//                 // ScreenUtil().setWidth(310)
//                 // :
//                 // index==3
//                 // ?
//                 // ScreenUtil().setWidth(280)
//                 // :
//                 // index==4
//                 // ?
//                 // ScreenUtil().setWidth(280)
//                 // :
//                 // ScreenUtil().setWidth(350),

//                 height: index == 5 || index == 6 || index == 7
//                     ? ScreenUtil().setHeight(170)
//                     : ScreenUtil().setHeight(130),
//                 decoration: BoxDecoration(
//                     color: index == 0
//                         ? pinkColor
//                         : index == 1
//                             ? green6
//                             : index == 2
//                                 ? blue7
//                                 : index == 3
//                                     ? color888
//                                     : index == 4
//                                         ? color999
//                                         : index == 5
//                                             ? pinkColor
//                                             : index == 6
//                                                 ? color888
//                                                 : index == 7
//                                                     ? green6
//                                                     : pinkColor,
//                     borderRadius: borderRadius8),
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 5, left: 10, right: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(right: 0),
//                         child: Align(
//                             alignment: Alignment.centerRight,
//                             child: Text(
//                               dataLevel[index].name,
//                               style: styleTitleCardClasses,
//                             )),
//                       ),
//                       Text(
//                         "${dataLevel[index].usersCount} طالب مسجل",
//                         style: styleSubTitleCardClasses,
//                       ),
//                       Divider(
//                         color: whiteColor,
//                         thickness: 1,
//                         endIndent: 20,
//                       ),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Container(
//                           alignment: Alignment.centerRight,
//                           height: ScreenUtil().setHeight(32),
//                           width: ScreenUtil().setWidth(220),
//                           child: Text(
//                             dataLevel[index].description,
//                             textAlign: TextAlign.end,
//                             style: styleSubTitleCardClasses,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               // index == 0
//               //  ?
//               //  Transform.translate(
//               //    offset: Offset(
//               //      ScreenUtil().setWidth(10),
//               //       ScreenUtil().setHeight(-30)
//               //       ),
//               //                     child: Align(
//               //      alignment: Alignment.bottomLeft,
//               //      child: Container(
//               //        width: ScreenUtil().setWidth(60),
//               //        height: ScreenUtil().setHeight(60),
//               //        decoration: BoxDecoration(
//               //          color: whiteColor,
//               //          shape: BoxShape.circle
//               //        ),
//               //      ),
//               //    ),
//               //  )
//               //  :
//               //   index == 1
//               //  ?
//               //  Transform.translate(
//               //    offset: Offset(
//               //    ScreenUtil().setWidth(15),
//               //       ScreenUtil().setHeight(-32)
//               //       ),
//               //                     child: Align(
//               //      alignment: Alignment.bottomLeft,
//               //      child: Container(
//               //        width: ScreenUtil().setWidth(60),
//               //        height: ScreenUtil().setHeight(60),
//               //        decoration: BoxDecoration(
//               //          color: whiteColor,
//               //          shape: BoxShape.circle
//               //        ),
//               //      ),
//               //    ),
//               //  )
//               //  :
//               //  index == 2
//               //  ?
//               //  Transform.translate(
//               //    offset: Offset(
//               //    ScreenUtil().setWidth(5),
//               //       ScreenUtil().setHeight(-60)
//               //       ),
//               //                     child: Align(
//               //      alignment: Alignment.bottomLeft,
//               //      child: Container(
//               //        width: ScreenUtil().setWidth(45),
//               //        height: ScreenUtil().setHeight(60),
//               //        decoration: BoxDecoration(
//               //          color: whiteColor,
//               //         //shape: BoxShape.circle
//               //        ),
//               //      ),
//               //    ),
//               //  )
//               //  :
//               //  Container()
//               //  ,

//               Align(
//                   alignment: Alignment.centerLeft,
//                   child: Transform.translate(
//                     offset: Offset(0, ScreenUtil().setHeight(30)),
//                     child: index == 0
//                         ? Text(
//                             "5",
//                             style: styleNumberCardClasses,
//                           )
//                         : index == 1
//                             ? Text(
//                                 "6",
//                                 style: styleNumberCardClasses.copyWith(
//                                     color: green6),
//                               )
//                             : index == 2
//                                 ? Text(
//                                     "7",
//                                     style: styleNumberCardClasses.copyWith(
//                                         color: blue7),
//                                   )
//                                 : index == 3
//                                     ? Text(
//                                         "8",
//                                         style: styleNumberCardClasses.copyWith(
//                                             color: color888),
//                                       )
//                                     : index == 4
//                                         ? Text(
//                                             "9",
//                                             style: styleNumberCardClasses
//                                                 .copyWith(color: color999),
//                                           )
//                                         : index == 5
//                                             ? Text(
//                                                 "10",
//                                                 style: styleNumberCardClasses
//                                                     .copyWith(
//                                                         color: pinkColor,
//                                                         fontSize: 110,
//                                                         shadows: <BoxShadow>[
//                                                       boxShadow12b
//                                                     ]),
//                                               )
//                                             : index == 6
//                                                 ? Text(
//                                                     "11",
//                                                     style:
//                                                         styleNumberCardClasses
//                                                             .copyWith(
//                                                                 color: color888,
//                                                                 fontSize: 110,
//                                                                 shadows: <
//                                                                     BoxShadow>[
//                                                           boxShadow12b
//                                                         ]),
//                                                   )
//                                                 : index == 7
//                                                     ? Text(
//                                                         "12",
//                                                         style: styleNumberCardClasses
//                                                             .copyWith(
//                                                                 color: green6,
//                                                                 fontSize: 115,
//                                                                 shadows: <
//                                                                     BoxShadow>[
//                                                               boxShadow12b
//                                                             ]),
//                                                       )
//                                                     : Text(
//                                                         "8",
//                                                         style:
//                                                             styleNumberCardClasses
//                                                                 .copyWith(
//                                                                     color:
//                                                                         color888),
//                                                       ),
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pythagoras/components/models/levels.dart';

class YearListAddress extends StatelessWidget {
  int index;
  List<LevelsData> dataLevel;
  YearListAddress({this.dataLevel,this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      child: Stack(alignment: Alignment.centerRight, children: [
        Image.asset(
          'assets/images/${index+5}.png',
          fit: BoxFit.cover,
          //height: 250,
        ),
        Directionality(
          textDirection: TextDirection.ltr,
                  child: Container(
            
            padding: EdgeInsets.only(right: 10, top: 4, left: index+5 <= 9 ? 83 : 131, bottom: 1),
            //height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  dataLevel[index].name,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${dataLevel[index].usersCount} طالب مسجل",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 3,
                  color: Colors.white,
                  thickness: 1,
                  indent: 33,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  dataLevel[index].description,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

