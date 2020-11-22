import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pythagoras/animate_do.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:pythagoras/bloc2/bloc_class2.dart';
import 'package:pythagoras/bloc2/bloc_events2.dart';
import 'package:pythagoras/bloc2/bloc_states2.dart';
import 'package:pythagoras/components/models/video.dart';
import 'package:pythagoras/features/users/ui/screens/live_screen.dart';
import 'package:pythagoras/features/users/ui/screens/watch_classes2.dart';
import 'package:pythagoras/features/users/ui/widgets/card_watch.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/styles.dart';
import 'package:videos_player/model/control.model.dart';
import 'package:videos_player/model/video.model.dart';
import 'package:videos_player/videos_player.dart';

class WatchClasses extends StatefulWidget {
  String level;
  String term;
  int unitId;
  WatchClasses({this.level, this.term, this.unitId});
  @override
  _WatchClassesState createState() => _WatchClassesState();
}

class _WatchClassesState extends State<WatchClasses> {
  NetworkVideoControl networkVideoControl;
  String video1;

  isBob(BuildContext context) {
    BlocProvider.of<UserBloc>(context)
        .add(UnitEvent(widget.term, widget.level));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                size: 25,
                color: whiteColor,
              ),
              onPressed: () {})
        ],
        leading: Icon(Icons.share),
        backgroundColor: pinkColor,
        title: Column(
          children: [
            Text(
              widget.level == "1"
                  ? "الصف الثاني عشر "
                  : widget.level == "2"
                      ? "الصف الحادي عشر "
                      : widget.level == "3"
                          ? "الصف العاشر الابتدائي"
                          : widget.level == "4"
                              ? "الصف التاسع الابتدائي"
                              : widget.level == "5"
                                  ? "الصف الثامن الابتدائي"
                                  : widget.level == "6"
                                      ? "الصف السايع الابتدائي"
                                      : widget.level == "7"
                                          ? "الصف السادس الابتدائي"
                                          : widget.level == "8"
                                              ? "الصف الخامس الابتدائي"
                                              : "",
              style: styleTitleAppBarYears,
            ),
            Text(
                widget.term == "1"
                    ? "الفصل الدراسي الأول "
                    : widget.term == "2"
                        ? "الفصل الدراسي الثاني "
                        : "",
                style: styleTitleAppBarYears.copyWith(fontSize: 10)),
          ],
        ),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return isBob(context);
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: ScreenUtil().setHeight(300),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: hintColor,
                ),
                child: BlocBuilder<UserBloc2, BlocStates2>(
                    builder: (context, state) {
                  if (state is TasksLoadingState2) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is EmptyTasksState2) {
                    return Center(
                      child: Text('Empty Tasks'),
                    );
                  } else if (state is TasksErrorState2) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is SetVideoState2) {
                    // BlocProvider.of<UserBloc>(context).add(VideoEvent());
                    String vdint = state.newVideo;
                    //video1= state.newVideo;

                    // Provider.of<AuthProviderUser>(context)
                    //     .setVideoOflineUrl(vdint);

                    print("888888888888888888888888888888 $vdint");

                    return VideosPlayer(networkVideos: [
                      NetworkVideo(
                          id: "1",
                          name: "Elephant Dream",
                          videoUrl: vdint != null && vdint != ''
                              ? vdint
                              : 'https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4',
                          thumbnailUrl:
                              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
                          videoControl: NetworkVideoControl(
                            fullScreenByDefault: false,

                          )),
                    ],
                    maxVideoPlayerHeight: ScreenUtil().setHeight(300),

                    );
                  }
                  return Container(
                    color: Colors.red,
                  );
                }),

                // Center(
                //   child: Icon(
                //     Icons.play_circle_filled,
                //     size: 50,
                //     color: whiteColor,
                //   ),
                // ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),
              Container(child:
                  BlocBuilder<UserBloc, BlocStates>(builder: (context, state) {
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
                  List<VideoData> videoData = state.data;
                  List<VideoData> videoDataOfline = videoData
                      .where((element) => element.type == "OFFLINE")
                      .toList();
                      if(videoDataOfline[0].path == null || videoDataOfline[0].path == ''){
                         BlocProvider.of<UserBloc2>(context).add(SetVideoEvent2(
                      "https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4"));
                      }else{
                       BlocProvider.of<UserBloc2>(context).add(SetVideoEvent2(
                      "https://api.pythagorath.com/storage/videos/${videoDataOfline[0].path}"));
                      }
                  

                  // videoOfline =
                  //     "https://api.pythagorath.com/storage/videos/${videoDataOfline[0].path}";
                  // setState(() {

                  // });

                  return Column(
                    children: [
                      Text(
                        "الدرس الاول",
                        style: styleTitleDetails.copyWith(fontSize: 12),
                      ),
                      Text(
                        "حساب الاعداد الصحيحة",
                        style: styleTitleAppBarYears.copyWith(
                            color: deepGreenColor),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(12),
                      ),
                      Container(
                          height: ScreenUtil().setHeight(350),
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: videoData.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: () {
                                    // if (videoData[index].status == "PAID") {
                                    //    showDialog(
                                    //     context: context,
                                    //     builder: (context) {
                                    //       return CardPaymentDialog();
                                    //     },
                                    //   );

                                    // }else{
                                    if (videoData[index].type == "OFFLINE") {
                                      BlocProvider.of<UserBloc>(this.context)
                                          .add(IsAccessVideoEvent(
                                              videoData[index].id.toString(),
                                              this.context,
                                              WatchClasses2(
                                                level: widget.level,
                                                term: widget.term,
                                                videoUrl:
                                                    "https://api.pythagorath.com/storage/videos/${videoData[index].path}",
                                              ),
                                              widget.unitId
                                              
                                              ));
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
                                      Timer(Duration(seconds: 1), () async {
                                        BlocProvider.of<UserBloc>(this.context)
                                            .add(IsAccessVideoEvent(
                                                videoData[index].id.toString(),
                                                this.context,
                                                LiveScreen(
                                                  linkLive:
                                                      videoData[index].link,
                                                  level: widget.level,
                                                  term: widget.term,
                                                ),
                                                widget.unitId
                                                ));
                                      });

                                      // BlocProvider.of<UserBloc>(this.context).add(
                                      // UnitEvent(widget.term, widget.level));

                                      // }

                                    }
                                  },
                                  child: SlideInRight(
                                      animate: true,
                                      duration: Duration(
                                          milliseconds: 1000 + (300 * index)),
                                      child: CardWatch(
                                        videoData: videoData[index],
                                        index: index,
                                      )));
                            },
                          ))
                    ],
                  );
                }
                return Container();
              })),
            ],
          ),

          //  Column(
          //   children: [
          //     Container(
          //       height: ScreenUtil().setHeight(220),
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //         color: hintColor,
          //       ),
          //       child: VideosPlayer(
          //         networkVideos: [
          //           NetworkVideo(
          //                      id: "2",
          //                      name: "Elephant Dream",
          //                      videoUrl:
          //                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
          //                      thumbnailUrl:
          //                          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
          //                      videoControl: new NetworkVideoControl(
          //                        fullScreenByDefault: false,
          //                      )),
          //         ])
          //       // Center(
          //       //   child: Icon(
          //       //     Icons.play_circle_filled,
          //       //     size: 50,
          //       //     color: whiteColor,
          //       //   ),
          //       // ),
          //     ),
          //     SizedBox(
          //       height: ScreenUtil().setHeight(10),
          //     ),
          //     Text(
          //       "الدرس الاول",
          //       style: styleTitleDetails.copyWith(fontSize: 12),
          //     ),
          //     Text(
          //       "حساب الاعداد الصحيحة",
          //       style: styleTitleAppBarYears.copyWith(color: deepGreenColor),
          //     ),
          //     SizedBox(
          //       height: ScreenUtil().setHeight(20),
          //     ),
          //     Container(
          //       height: ScreenUtil().setHeight(410),
          //       width: double.infinity,
          //       child: BlocBuilder<UserBloc, BlocStates>(
          //         builder: (context, state) {
          //           if (state is TasksLoadingState) {
          //             return Center(
          //               child: CircularProgressIndicator(),
          //             );
          //           } else if (state is EmptyTasksState) {
          //             return Center(
          //               child: Text('Empty Tasks'),
          //             );
          //           } else if (state is TasksErrorState) {
          //             return Center(
          //               child: Text(state.error),
          //             );
          //           } else if (state is VideoState) {
          //             List<VideoData> videoData = state.data;

          //             return ListView.builder(
          //               itemCount: videoData.length,
          //               itemBuilder: (context, index) {
          //                 return InkWell(
          //                     onTap: () {
          //                       showDialog(
          //                         context: context,
          //                         builder: (context) {
          //                           return CardPaymentDialog();
          //                         },
          //                       );
          //                     },
          //                     child: SlideInRight(
          //                         animate: true,
          //                         duration: Duration(
          //                             milliseconds: 1000 + (300 * index)),
          //                         child: CardWatch(
          //                           videoData: videoData[index],
          //                         )));
          //               },
          //             );
          //           }
          //         },
          //       ),
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}
