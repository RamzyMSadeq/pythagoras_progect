import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pythagoras/animate_do.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:pythagoras/bloc2/bloc_class2.dart';
import 'package:pythagoras/bloc2/bloc_events2.dart';
import 'package:pythagoras/bloc2/bloc_states2.dart';
import 'package:pythagoras/components/models/video.dart';
import 'package:pythagoras/features/users/providers/user_provider.dart';
import 'package:pythagoras/features/users/ui/screens/live_screen.dart';
import 'package:pythagoras/features/users/ui/screens/watch_classes2.dart';
import 'package:pythagoras/features/users/ui/widgets/card_watch.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/styles.dart';
import 'package:video_player/video_player.dart';

class WatchClasses extends StatefulWidget {
  String level;
  String term;
  int unitId;
  Color color;
  int price;
  WatchClasses({this.level, this.term, this.unitId, this.color, this.price});
  @override
  _WatchClassesState createState() => _WatchClassesState();
}

class _WatchClassesState extends State<WatchClasses> {
  // NetworkVideoControl networkVideoControl;
  //TargetPlatform _platform;
  VideoPlayerController videoPlayerController1;
  ChewieController chewieCont;
//  VideoPlayerController _videoPlayerController2;
  // ChewieController _chewieController;
  Future<void> futureController;
  bool isVideo = false;

  setIsVideo(bool val) {
    isVideo = val;
    setState(() {});
  }

  //VlcPlayerController controller;
  String video1;

  // bool isEmpty = false;

  isBob(BuildContext context) {
    if (isVideo != false) {
      videoPlayerController1.pause();
      //  _videoPlayerController2.pause();
    }

    BlocProvider.of<UserBloc>(context)
        .add(UnitEvent(widget.term, widget.level));
    return true;
  }

  @override
  void initState() {
    // controller = new VlcPlayerController(
    //     // Start playing as soon as the video is loaded
    //     );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController1.dispose();
    // _videoPlayerController2.dispose();
    //_chewieController.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.color,
        title: Column(
          children: [
            Text(
              widget.level == "1"
                  ? "الصف الخامس الإبتدائي"
                  : widget.level == "2"
                      ? "الصف السادس الإبتدائي"
                      : widget.level == "3"
                          ? "الصف السابع "
                          : widget.level == "4"
                              ? "الصف الثامن "
                              : widget.level == "5"
                                  ? "الصف التاسع "
                                  : widget.level == "6"
                                      ? "الصف العاشر "
                                      : widget.level == "7"
                                          ? "الصف الحادي عشر "
                                          : widget.level == "8"
                                              ? "الصف الثاني عشر "
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
          child: ListView(
            children: [
              // Provider.of<AuthProviderUser>(context).isEmpty == true
              //     ? Container(
              //         child: Center(
              //           child: Text("No Video"),
              //         ),
              //       )
              //     :
              // isVideo == false
              //     ? Container()
              //     : Container(
              //         height: ScreenUtil().setHeight(250),
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //           color: whiteColor,
              //         ),
              //         child: BlocBuilder<UserBloc2, BlocStates2>(
              //             builder: (context, state) {
              //           if (state is TasksLoadingState2) {
              //             return Center(
              //               child: CircularProgressIndicator(),
              //             );
              //           } else if (state is EmptyTasksState2) {
              //             return Center(
              //               child: Text('Empty Tasks'),
              //             );
              //           } else if (state is TasksErrorState2) {
              //             return Center(
              //               child: Text(state.error),
              //             );
              //           } else if (state is SetVideoState2) {
              //             // BlocProvider.of<UserBloc>(context).add(VideoEvent());
              //             String vdint = state.newVideo;
              //             print("8888888888888888888888888888888 $vdint");

              //             if (vdint == null || vdint == "") {
              //               setIsVideo(false);
              //             } else {
              //               setIsVideo(true);
              //             }

              //             //video1= state.newVideo;

              //             // Provider.of<AuthProviderUser>(context)
              //             //     .setVideoOflineUrl(vdint);

              //             print("888888888888888888888888888888 $vdint");

              //             //////////////////////////////////////////
              //             videoPlayerController1 =
              //                 VideoPlayerController.network(vdint);
              //             futureController =
              //                 videoPlayerController1.initialize();
              //             chewieCont = ChewieController(
              //               videoPlayerController: videoPlayerController1,
              //               //autoInitialize: true
              //             );
              //             // videoPlayerController1.setLooping(true);
              //             // videoPlayerController1.setVolume(25.5);
              //             // videoPlayerController1.play();
              //             // _videoPlayerController2 =
              //             //     VideoPlayerController.network(vdint);

              //             // _videoPlayerController2.pause();
              //             //     _videoPlayerController2.setVolume(100);
              //             // _chewieController = ChewieController(
              //             //     allowFullScreen: true,
              //             //     videoPlayerController: _videoPlayerController1,
              //             //     aspectRatio: 3 / 2,
              //             //     autoPlay: false,
              //             //     showControls: true,
              //             //     autoInitialize: true,
              //             //     placeholder: Container(
              //             //       color: whiteColor,
              //             //     )

              //             //     // autoPlay: true,
              //             //     // looping: true,
              //             //     // Try playing around with some of these other options:

              //             //     // showControls: false,
              //             //     // materialProgressColors: ChewieProgressColors(
              //             //     //   playedColor: Colors.red,
              //             //     //   handleColor: Colors.blue,
              //             //     //   backgroundColor: Colors.grey,
              //             //     //   bufferedColor: Colors.lightGreen,
              //             //     // ),
              //             //     // placeholder: Container(
              //             //     //   color: Colors.grey,
              //             //     // ),
              //             //     // autoInitialize: true,
              //             //     );

              //             return Container(
              //               height: ScreenUtil().setHeight(250),
              //               width: double.infinity,
              //               child: FutureBuilder(
              //                 future: futureController,
              //                 builder: (context, snapshot) {
              //                   if (snapshot.hasData) {
              //                     return Chewie(
              //                       controller: chewieCont,
              //                     );
              //                     //VideoPlayer(videoPlayerController1);
              //                   } else {
              //                     return Center(
              //                       child: CircularProgressIndicator(),
              //                     );
              //                   }
              //                 },
              //               ),
              //             );

              //             // return VideosPlayer(

              //             //   networkVideos: [

              //             //     NetworkVideo(

              //             //         id: "1",
              //             //         name: "Elephant Dream",
              //             //         videoUrl: vdint != null || vdint != ''
              //             //             ? vdint
              //             //             : 'https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4',
              //             //         thumbnailUrl:
              //             //             "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
              //             //         videoControl: NetworkVideoControl(
              //             //           fullScreenByDefault: false,

              //             //         )),

              //             //   ],
              //             //   //maxVideoPlayerHeight: ScreenUtil().setHeight(250),
              //             // );
              //           }
              //           return Container(
              //             color: Colors.red,
              //           );
              //         }),

              //         // Center(
              //         //   child: Icon(
              //         //     Icons.play_circle_filled,
              //         //     size: 50,
              //         //     color: whiteColor,
              //         //   ),
              //         // ),
              //       ),
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
                  List<VideoData> videoDataFiltter = videoData
                      .where((element) =>
                          element.levelId == int.parse(widget.level) &&
                          element.unitId == widget.unitId)
                      .toList();
                  List<VideoData> videoDataOfline = videoDataFiltter
                      .where((element) => element.type == "OFFLINE")
                      .toList();
                  List<VideoData> videoDataFiltterReverc =
                      videoDataFiltter.reversed.toList();
                  if (videoDataOfline.length == 0) {
                    //Provider.of<AuthProviderUser>(context).setIsEmpty(true);

                    BlocProvider.of<UserBloc2>(context).add(SetVideoEvent2(""));
                  } else {
                    // Provider.of<AuthProviderUser>(context).setIsEmpty(true);
                    if (videoDataOfline[0].path == null ||
                        videoDataOfline[0].path == '') {
                      BlocProvider.of<UserBloc2>(context)
                          .add(SetVideoEvent2(""));
                    } else {
                      //   Provider.of<AuthProviderUser>(context).setIsEmpty(false);
                      BlocProvider.of<UserBloc2>(context).add(SetVideoEvent2(
                          "${videoDataOfline[0].videoAccessUrl}"));
                    }
                  }

                  print("oooooookkkkkkkkiiiiiiii ${videoDataFiltter.length}");

                  // videoOfline =
                  //     "https://api.pythagorath.com/storage/videos/${videoDataOfline[0].path}";
                  // setState(() {

                  // });

                  return videoDataFiltter.isEmpty
                      ? Container(
                          child: Center(
                            child: Text("No Videos"),
                          ),
                        )
                      : Column(
                          children: [
                            // isVideo != false
                            //     ? Text(
                            //         "الدرس الاول",
                            //         style: styleTitleDetails.copyWith(
                            //             fontSize: 12),
                            //       )
                            //     : Container(),
                            // Text(
                            //   "",
                            //   style: styleTitleAppBarYears.copyWith(
                            //       color: deepGreenColor),
                            // ),
                            SizedBox(
                              height: ScreenUtil().setHeight(12),
                            ),
                            Container(
                                height: ScreenUtil().setHeight(700),
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: videoDataFiltter.length,
                                  itemBuilder: (context, index) {
                                    return videoDataFiltter.length == 0
                                        ? Container(
                                            child: Center(
                                              child: Text("No Videos"),
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              print(
                                                  "ssssssssssssssssttttttttttttttttt ${widget.unitId}");
                                              if (isVideo != false) {
                                                videoPlayerController1.pause();
                                                //   _videoPlayerController2.pause();
                                              }

                                              // if (videoData[index].status == "PAID") {
                                              //    showDialog(
                                              //     context: context,
                                              //     builder: (context) {
                                              //       return CardPaymentDialog();
                                              //     },
                                              //   );

                                              // }else{
                                              if (videoDataFiltter[index]
                                                      .type ==
                                                  "OFFLINE") {
                                                BlocProvider.of<UserBloc>(
                                                        this.context)
                                                    .add(IsAccessVideoEvent(
                                                        videoDataFiltter[index]
                                                            .id
                                                            .toString(),
                                                        this.context,
                                                        WatchClasses2(
                                                          unitId: widget.unitId,
                                                          level: widget.level,
                                                          term: widget.term,
                                                          videoUrl:
                                                              "${videoDataFiltter[index].videoAccessUrl}",
                                                          color: widget.color,
                                                          title:
                                                              "الدرس ${index + 1}",
                                                          desTitle:
                                                              videoDataFiltter[
                                                                      index]
                                                                  .title,
                                                          price: widget.price,
                                                        ),
                                                        widget.unitId,
                                                        widget.level,
                                                        widget.price));
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
                                                Provider.of<UserProvider>(
                                                        context,
                                                        listen: false)
                                                    .getVideoAccess(
                                                        videoDataFiltter[index]
                                                            .id
                                                            .toString());
                                                Future.delayed(
                                                    Duration(seconds: 1), () {
                                                  return BlocProvider.of<
                                                              UserBloc>(
                                                          this.context)
                                                      .add(IsAccessVideoEvent(
                                                          videoDataFiltter[
                                                                  index]
                                                              .id
                                                              .toString(),
                                                          this.context,
                                                          LiveScreen(
                                                            linkLive: Provider.of<
                                                                        UserProvider>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .link,
                                                            level: widget.level,
                                                            term: widget.term,
                                                            color: widget.color,
                                                          ),
                                                          widget.unitId,
                                                          widget.level,
                                                          widget.price));
                                                });

                                                // BlocProvider.of<UserBloc>(this.context).add(
                                                // UnitEvent(widget.term, widget.level));

                                                // }

                                              }
                                            },
                                            child: SlideInRight(
                                                animate: true,
                                                duration: Duration(
                                                    milliseconds:
                                                        1000 + (300 * index)),
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: ScreenUtil()
                                                          .setHeight(10)),
                                                  child: CardWatch(
                                                    videoData:
                                                        videoDataFiltterReverc[index],
                                                    index: index,
                                                  ),
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
