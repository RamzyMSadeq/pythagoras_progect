import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:pythagoras/components/models/levels.dart';
import 'package:pythagoras/components/models/video.dart';
import 'package:pythagoras/features/users/providers/auth_providers_user.dart';
import 'package:pythagoras/features/users/providers/user_provider.dart';
import 'package:pythagoras/features/users/ui/screens/Notification_screen.dart';
import 'package:pythagoras/features/users/ui/screens/classes_years.dart';
import 'package:pythagoras/features/users/ui/screens/classes_years11&12.dart';
import 'package:pythagoras/features/users/ui/screens/live_screen.dart';
import 'package:pythagoras/features/users/ui/screens/setting_screen.dart';
import 'package:pythagoras/features/users/ui/screens/watch_classes2.dart';
import 'package:pythagoras/features/users/ui/widgets/card_clasess2.dart';
import 'package:pythagoras/features/users/ui/widgets/card_search.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/constants.dart';
import 'package:pythagoras/values/styles.dart';

class ClassesScreen2 extends StatefulWidget {
  @override
  _ClassesScreen2State createState() => _ClassesScreen2State();
}

class _ClassesScreen2State extends State<ClassesScreen2> {
  int count2;
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(LevelsEvent());

    super.initState();
  }

  @override
  String search = "";
  @override
  Widget build(BuildContext context) {
    int count = Provider.of<AuthProviderUser>(context).countNotificationSp;
    if (Provider.of<AuthProviderUser>(context).countNotification == null) {
      count2 = 0;
    } else {
      count2 = Provider.of<AuthProviderUser>(context).countNotification;
    }

    if (count2 > count) {
      Provider.of<AuthProviderUser>(context)
          .setCountNotification(count2 - count);
    } else {
      Provider.of<AuthProviderUser>(context).setCountNotification(0);
    }
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(MeUserEvent());
                push(context, SettingScreen());
              }),
        ],
        leading: InkWell(
          onTap: () {
            BlocProvider.of<UserBloc>(context).add(NotificationEvent());
            push(
                context,
                NotificationScreen(
                    // levelId: "0",
                    ));
          },
          child: Badge(
            // padding: EdgeInsets.all(10),
            position: BadgePosition(top: 1, end: 1),
            badgeContent: Text(Provider.of<AuthProviderUser>(context)
                .countNotification
                .toString()),
            child: Icon(
              Icons.notifications,
              size: 25,
              color: whiteColor,
            ),
          ),
        ),
        //  IconButton(
        //     icon: Icon(
        //       Icons.notifications,
        //       size: 25,
        //       color: whiteColor,
        //     ),
        //     onPressed: () {
        //        BlocProvider.of<UserBloc>(context).add(NotificationEvent());
        //       push(context, NotificationScreen());
        //     }),
        backgroundColor: orangeColor,
        title: Column(
          children: [
            // SvgPicture.asset(
            //   title,
            //   fit: BoxFit.fill,
            // ),
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
      // appBar: AppBar(
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.vertical(
      //         bottom: Radius.circular(10),
      //       ),),
      //   leading: InkWell(
      //     onTap: () {},
      //     child: Container(
      //       padding: EdgeInsets.all(2),
      //       margin: EdgeInsets.all(5),
      //       child: Icon(
      //         Icons.settings,
      //         color: Theme.of(context).primaryColor,
      //       ),
      //       decoration:
      //           BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      //     ),
      //   ),
      //   actions: [
      //     InkWell(
      //       onTap: () {},
      //       child: Container(
      //         padding: EdgeInsets.all(2),
      //         margin: EdgeInsets.only(right: 20),
      //         child: Icon(
      //           Icons.notifications,
      //           color: Theme.of(context).primaryColor,
      //         ),
      //         decoration:
      //             BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      //       ),
      //     ),
      //   ],
      //   backgroundColor: Theme.of(context).primaryColor,
      //   title: Column(
      //     children: [
      //       Padding(
      //         padding: EdgeInsets.only(top: 5),
      //         child: Image.asset(
      //           'assets/images/qwd.png',
      //           fit: BoxFit.fill,
      //           height: 30,
      //         ),
      //         /*Text(
      //         'فيثاغورث',
      //         style: TextStyle(color: Colors.white, fontSize: 23),
      //       ),*/
      //       ),
      //       Center(
      //         child: Image.asset('assets/images/math.png'),
      //         /*Text('متعة تعلم الرياضيات',
      //             style: TextStyle(color: Colors.white, fontSize: 10))*/
      //       ),
      //     ],
      //   ),
      //   centerTitle: true,
      //   elevation: 2,
      //   bottom: _buildBottomBar(context),
      // ),
      body: ListView(
        children: [
          Container(
            height: ScreenUtil().setHeight(50),
            width: double.infinity,
            decoration:
                BoxDecoration(color: orangeColor, boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 6,
                  color: blackColor.withOpacity(.16),
                  offset: Offset(0, 3))
            ]),
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                  vertical: ScreenUtil().setHeight(6)),
              height: ScreenUtil().setHeight(45),
              width: ScreenUtil().setWidth(315),
              decoration: BoxDecoration(
                  borderRadius: borderRadius22, color: whiteColor),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  onChanged: (value) {
                    if (value != null || value != "") {
                      BlocProvider.of<UserBloc>(context).add(VideoEvent());
                    } else {
                      BlocProvider.of<UserBloc>(context).add(LevelsEvent());
                    }

                    search = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 2),
                      border: InputBorder.none,
                      hintText: "بحث",
                      hintStyle: styleTextFieldLogIn,
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          search == null || search == ""
              ? Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  height: ScreenUtil().setHeight(665),
                  width: double.infinity,
                  child: BlocBuilder<UserBloc, BlocStates>(
                    builder: (context, state) {
                      if (state is TasksLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is EmptyTasksState) {
                        return Center(
                          child: Text('Empty Tasks'),
                        );
                      } else if (state is TasksErrorState) {
                        return Center(
                          child: Text(state.error),
                        );
                      } else if (state is LevelsState) {
                        List<LevelsData> dataLevels = state.data;
                        List<LevelsData> dataLevels2 =
                            dataLevels.reversed.toList();

                        return ListView.builder(
                          itemCount: dataLevels.length,
                          itemBuilder: (context, index) {
                            return Container(
                              //color: Colors.amber,
                              child: InkWell(
                                onTap: () {
                                  BlocProvider.of<UserBloc>(context)
                                      .add(SettingsEvent());
                                  if (index == 6 || index == 7) {
                                    push(
                                        context,
                                        ClassesYears2(
                                          level:
                                              dataLevels2[index].id.toString(),
                                          color: index == 0
                                              ? color5
                                              : index == 1
                                                  ? color6
                                                  : index == 2
                                                      ? color7
                                                      : index == 3
                                                          ? color8
                                                          : index == 4
                                                              ? color9
                                                              : index == 5
                                                                  ? color10
                                                                  : index == 6
                                                                      ? color11
                                                                      : index ==
                                                                              7
                                                                          ? color12
                                                                          : color12,
                                        ));
                                  } else {
                                    push(
                                        context,
                                        ClassesYears(
                                          level:
                                              dataLevels2[index].id.toString(),
                                          color: index == 0
                                              ? color5
                                              : index == 1
                                                  ? color6
                                                  : index == 2
                                                      ? color7
                                                      : index == 3
                                                          ? color8
                                                          : index == 4
                                                              ? color9
                                                              : index == 5
                                                                  ? color10
                                                                  : index == 6
                                                                      ? color11
                                                                      : index ==
                                                                              7
                                                                          ? color12
                                                                          : color12,
                                        ));
                                  }
                                },
                                child:
                                    // Container(
                                    //   height: ScreenUtil().setHeight(250),
                                    //   width: ScreenUtil().setWidth(350),
                                    //   child: SvgPicture.asset(container5,fit: BoxFit.fill,),
                                    // )
                                    YearListAddress(
                                  index: index,
                                  dataLevel: dataLevels.reversed.toList(),
                                  // address: 'الصف الخامس الابتدائي',
                                  // des:
                                  //     'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة، لقد تم توليد هذا النص من مواد النص العربي، حيث يمكنك ان تولد مثل هذا ',
                                  // image: 'assets/images/5.png',
                                  // num1: '20.000 طالب مسجل',
                                  // year: 5,
                                ),

                                //     CardClasess(
                                //   index: index,
                                //   dataLevel: dataLevels.reversed.toList(),
                                // )
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                )
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    height: ScreenUtil().setHeight(665),
                    width: double.infinity,
                    child: BlocBuilder<UserBloc, BlocStates>(
                      builder: (context, state) {
                        if (state is TasksLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is EmptyTasksState) {
                          return Center(
                            child: Text('Empty Tasks'),
                          );
                        } else if (state is TasksErrorState) {
                          return Center(
                            child: Text(state.error),
                          );
                        } else if (state is VideoState) {
                          List<VideoData> allVideo = state.data;
                          List<VideoData> searchVideo = allVideo
                              .where(
                                  (element) => element.title.contains(search))
                              .toList();

                          return ListView.builder(
                            itemCount: searchVideo.length,
                            itemBuilder: (context, index) {
                              //    print(
                              //  "sssssddddddcccccccccccccccccccc ${searchVideo[index].title}");
                              return InkWell(
                                onTap: () {
                                  if (searchVideo[index].type == "OFFLINE") {
                                    BlocProvider.of<UserBloc>(this.context).add(
                                        IsAccessVideoEvent(
                                            searchVideo[index].id.toString(),
                                            this.context,
                                            WatchClasses2(
                                              unitId: searchVideo[index].unitId,
                                              level: searchVideo[index]
                                                  .levelId
                                                  .toString(),
                                              term: searchVideo[index]
                                                  .unit
                                                  .term
                                                  .toString(),
                                              videoUrl:
                                                  "${searchVideo[index].videoAccessUrl}",
                                              color: pinkColor,
                                              title: "الدرس ${index + 1}",
                                              desTitle:
                                                  searchVideo[index].title,
                                              price: double.parse(
                                                  "${searchVideo[index].unit.price}"),
                                            ),
                                            searchVideo[index].unitId,
                                            searchVideo[index]
                                                .levelId
                                                .toString(),
                                            double.parse(
                                                "${searchVideo[index].unit.price}")));
                                    // Provider.of<AuthProviderUser>(context,
                                    //         listen: false)
                                    //     .setVideoOflineUrl(
                                    //         'https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4');
                                    // push(
                                    //     context,
                                    //     WatchClasses(
                                    //       level: widget.level,
                                    //       term: widget.term,
                                    //     ));
                                    // BlocProvider.of<UserBloc2>(context).add(SetVideoEvent2(
                                    // null));
                                    // BlocProvider.of<UserBloc2>(context).add(
                                    //     SetVideoEvent2(
                                    //         'https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4'));
                                    // push(
                                    //     context,
                                    //     WatchClasses(
                                    //       level: widget.level,
                                    //       term: widget.term,
                                    //     ));

                                  } else {
                                    // BlocProvider.of<UserBloc>(this.context).add(
                                    //     UnitEvent(widget.term, widget.level));
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .getVideoAccess(
                                            searchVideo[index].id.toString());
                                    Future.delayed(Duration(seconds: 1), () {

                                      return BlocProvider.of<UserBloc>(this.context).add(
                                        IsAccessVideoEvent(
                                            searchVideo[index].id.toString(),
                                            this.context,
                                            LiveScreen(
                                              linkLive:
                                                  Provider.of<UserProvider>(
                                                          context,
                                                          listen: false)
                                                      .link,
                                              level: searchVideo[index]
                                                  .levelId
                                                  .toString(),
                                              term: searchVideo[index]
                                                  .unit
                                                  .term
                                                  .toString(),
                                              color: pinkColor,
                                            ),
                                            searchVideo[index].unitId,
                                            searchVideo[index]
                                                .levelId
                                                .toString(),
                                            double.parse(
                                                "${searchVideo[index].unit.price}")));
                                    });
                                    

                                    // }

                                  }
                                },
                                child: CardSearch(
                                  myVideo: searchVideo[index],
                                ),
                              );
                            },
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                )

          // YearListAddress(
          //   address: 'الصف الخامس الابتدائي',
          //   des:
          //       'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة، لقد تم توليد هذا النص من مواد النص العربي، حيث يمكنك ان تولد مثل هذا ',
          //   image: 'assets/images/5.png',
          //   num: '20.000 طالب مسجل',
          //   year: 5,
          // ),

          // YearListAddress(
          //   address: 'الصف السادس الابتدائي',
          //   des:
          //       'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة، لقد تم توليد هذا النص من مواد النص العربي، حيث يمكنك ان تولد مثل هذا ',
          //   image: 'assets/images/6.png',
          //   num: '20.000 طالب مسجل',
          //   year: 6,
          // ),
          // YearListAddress(
          //   address: 'الصف السابع الابتدائي',
          //   des:
          //       'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة، لقد تم توليد هذا النص من مواد النص العربي، حيث يمكنك ان تولد مثل هذا ',
          //   image: 'assets/images/7.png',
          //   num: '20.000 طالب مسجل',
          //   year: 7,
          // ),
          // YearListAddress(
          //   address: 'الصف الثامن الابتدائي',
          //   des:
          //       'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة، لقد تم توليد هذا النص من مواد النص العربي، حيث يمكنك ان تولد مثل هذا ',
          //   image: 'assets/images/8.png',
          //   num: '20.000 طالب مسجل',
          //   year: 8,
          // ),
          // YearListAddress(
          //   address: 'الصف التاسع الابتدائي',
          //   des:
          //       'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة، لقد تم توليد هذا النص من مواد النص العربي، حيث يمكنك ان تولد مثل هذا ',
          //   image: 'assets/images/9.png',
          //   num: '20.000 طالب مسجل',
          //   year: 9,
          // ),
          // YearListAddress(
          //   address: 'الصف العاشر الابتدائي',
          //   des:
          //   'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة، لقد تم توليد هذا النص من مواد النص العربي، حيث يمكنك ان تولد مثل هذا ',
          //   image: 'assets/images/10.png',
          //   num: '20.000 طالب مسجل',
          //   year: 10,
          // ),
          // YearListAddress(
          //   address: 'الصف الحادي عشر الابتدائي',
          //   des:
          //   'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة، لقد تم توليد هذا النص من مواد النص العربي، حيث يمكنك ان تولد مثل هذا ',
          //   image: 'assets/images/11.png',
          //   num: '20.000 طالب مسجل',
          //   year: 11,
          // ),
          // YearListAddress(
          //   address: 'الصف الثاني عشر الابتدائي',
          //   des:
          //   'هذا النص هو مثال لنص يمكن ان يستبدل في نفس المساحة، لقد تم توليد هذا النص من مواد النص العربي، حيث يمكنك ان تولد مثل هذا ',
          //   image: 'assets/images/12.png',
          //   num: '20.000 طالب مسجل',
          //   year: 12,
          // ),
        ],
      ),
    );
  }

  // PreferredSize _buildBottomBar(context) {
  //   return PreferredSize(
  //     preferredSize: Size.fromHeight(50),
  //     child: Container(
  //       padding: EdgeInsets.all(9),
  //       child: Column(
  //         children: [
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 10),
  //             child: Material(
  //               elevation: 4,
  //               borderRadius: BorderRadius.all(Radius.circular(30)),
  //               child: Directionality(
  //                 textDirection: TextDirection.rtl,
  //                 child: TextField(
  //                   textDirection: TextDirection.rtl,
  //                   cursorColor: Colors.black38,
  //                   style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 18,
  //                   ),
  //                   decoration: InputDecoration(
  //                       hintText: 'بحث',
  //                       hintStyle: TextStyle(
  //                         color: Colors.black38,
  //                         fontSize: 16,
  //                       ),
  //                       prefixIcon: Material(
  //                         elevation: 0,
  //                         borderRadius: BorderRadius.all(Radius.circular(30)),
  //                         child: IconButton(
  //                           icon: Icon(Icons.search_outlined),
  //                           onPressed: () {},
  //                           color: Colors.black38,
  //                         ),
  //                       ),
  //                       border: InputBorder.none,
  //                       contentPadding:
  //                           EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
  //                 ),
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

// class YearListAddress extends StatelessWidget {
//   String image, address, des, num;
//   int  year;
//   YearListAddress({this.image, this.address, this.des, this.num, this.year});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(13),
//       child: Stack(alignment: Alignment.centerRight, children: [
//         Image.asset(
//           image,
//           fit: BoxFit.cover,
//           //height: 250,
//         ),
//         Container(
//           padding: EdgeInsets.only(right: 10, top: 4, left: year <= 9 ? 83 : 131, bottom: 1),
//           //height: 200,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 address,
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 num,
//                 textAlign: TextAlign.right,
//                 textDirection: TextDirection.rtl,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 10,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Divider(
//                 height: 3,
//                 color: Colors.white,
//                 thickness: 1,
//                 indent: 33,
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 des,
//                 textAlign: TextAlign.right,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 10,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         )
//       ]),
//     );
//   }
// }
