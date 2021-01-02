import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:pythagoras/animate_do.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:pythagoras/components/models/video.dart';
import 'package:pythagoras/features/users/providers/user_provider.dart';
import 'package:pythagoras/features/users/repo/api_user_repo.dart';
import 'package:pythagoras/features/users/ui/screens/live_screen.dart';
import 'package:pythagoras/features/users/ui/widgets/card_watch.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/styles.dart';
import 'package:video_player/video_player.dart';

class WatchClasses2 extends StatefulWidget {
  String level;
  String term;
  String videoUrl;
  int unitId;
  Color color;
  String title;
  String desTitle;
  double price;
  WatchClasses2(
      {this.level,
      this.term,
      this.videoUrl,
      this.unitId,
      this.color,
      this.title,
      this.desTitle,
      this.price});
  @override
  _WatchClasses2State createState() => _WatchClasses2State();
}

class _WatchClasses2State extends State<WatchClasses2> {
  // NetworkVideoControl networkVideoControl;

  // isBob(BuildContext context) {
  //   BlocProvider.of<UserBloc>(context)
  //       .add(UnitEvent(widget.term, widget.level));
  //   return true;
  // }
  VideoPlayerController videoPlayerCont;
  Future<void> futureCont;
  ChewieController chewieController;

  //VideoPlayerController _videoPlayerController2;
  //ChewieController _chewieController;
  static const _pageSize = 20;

  final PagingController<int, VideoData> _pagingController =
      PagingController(firstPageKey: 0);

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ApiRepositoryUser.apiRepositoryUser
          .videoUserPage(widget.level, widget.unitId.toString());
      final newItems1 = newItems.reversed.toList();
      final isLastPage = newItems1.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems1);
      } else {
        final nextPageKey = pageKey + newItems1.length;
        _pagingController.appendPage(newItems1, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(VideoEvent());
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    ////////////////////////////////////////////
    videoPlayerCont = VideoPlayerController.network(widget.videoUrl);
    futureCont = videoPlayerCont.initialize();
    //videoPlayerCont.play();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerCont,
      // autoInitialize: true
    );
    //  _videoPlayerController2 = VideoPlayerController.network(widget.videoUrl);
    // _chewieController = ChewieController(
    // videoPlayerController: _videoPlayerController1,
    // aspectRatio: 3 / 2,
    // autoPlay: false,
    // showControls: true,
    // autoInitialize: true,

    // autoPlay: true,
    //    looping: true,
    // Try playing around with some of these other options:

    // showControls: false,
    // materialProgressColors: ChewieProgressColors(
    //   playedColor: Colors.red,
    //   handleColor: Colors.blue,
    //   backgroundColor: Colors.grey,
    //   bufferedColor: Colors.lightGreen,
    // ),
    // placeholder: Container(
    //   color: Colors.grey,
    // ),
    // autoInitialize: true,
    //  );

    // networkVideoControl = NetworkVideoControl(
    //   fullScreenByDefault: false,
    // );
    //  BlocProvider.of<UserBloc>(context).add(SetVideoEvent(
    //                 'https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4'
    //               ));
    //               BlocProvider.of<UserBloc>(context).add(VideoEvent());
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
    videoPlayerCont.dispose();
    chewieController.dispose();
    _pagingController.dispose();
    // _videoPlayerController2.dispose();
    // _chewieController.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("sssssssssssssssssssssssssssssssss ${widget.videoUrl}");
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: ScreenUtil().setHeight(250),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: whiteColor,
                  ),

                  child: FutureBuilder(
                    future: futureCont,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Chewie(
                          controller: chewieController,
                        );
                        //VideoPlayer(videoPlayerCont);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  // child: VideosPlayer(
                  //   networkVideos: [
                  //     NetworkVideo(
                  //         id: "1",
                  //         name: "Elephant Dream",
                  //         videoUrl: widget.videoUrl != null && widget.videoUrl != ''
                  //             ? widget.videoUrl
                  //             : 'https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4',
                  //         thumbnailUrl:
                  //             "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
                  //         videoControl: networkVideoControl),
                  //   ],
                  //   maxVideoPlayerHeight: ScreenUtil().setHeight(300),
                  // ),

                  // Center(
                  //   child: Icon(
                  //     Icons.play_circle_filled,
                  //     size: 50,
                  //     color: whiteColor,
                  //   ),
                  // ),
                ),
                // Container(
                //   height: ScreenUtil().setHeight(250),
                //   width: double.infinity,
                //   child: Center(
                //     child: RaisedButton(
                //       child: Icon(videoPlayerCont.value.isPlaying
                //           ? Icons.pause
                //           : Icons.play_arrow),
                //       onPressed: () {
                //         setState(() {
                //           if (videoPlayerCont.value.isPlaying) {
                //             videoPlayerCont.pause();
                //           } else {
                //             videoPlayerCont.play();
                //           }
                //         });
                //       },
                //     ),
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(5),
            ),
            Text(
              widget.title,
              style: styleTitleDetails.copyWith(fontSize: 12),
            ),
            Text(
              widget.desTitle,
              style: styleTitleAppBarYears.copyWith(color: deepGreenColor),
            ),

            Container(
              height: ScreenUtil().setHeight(500),
              child: PagedListView<int, VideoData>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<VideoData>(
                    itemBuilder: (context, item, index) {
                      return Container(
                        margin:
                            EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                        child: InkWell(
                          onTap: () {
                            videoPlayerCont.pause();
                            //  _videoPlayerController2.pause();
                            // if (videoData[index].status == "PAID") {
                            //    showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return CardPaymentDialog();
                            //     },
                            //   );

                            // }else{
                            if (item.type == "OFFLINE") {
                              BlocProvider.of<UserBloc>(this.context)
                                  .add(IsAccessVideoEvent(
                                      item.id.toString(),
                                      this.context,
                                      WatchClasses2(
                                        unitId: widget.unitId,
                                        level: widget.level,
                                        term: widget.term,
                                        videoUrl: "${item.videoAccessUrl}",
                                        color: widget.color,
                                        title: "الدرس ${index + 1}",
                                        desTitle: item.title,
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
                              // BlocProvider.of<UserBloc>(this.context).add(
                              //     UnitEvent(widget.term, widget.level));
                              Provider.of<UserProvider>(context, listen: false)
                                  .getVideoAccess(item.id.toString());
                              Future.delayed(Duration(seconds: 1), () {
                                return BlocProvider.of<UserBloc>(this.context)
                                  .add(IsAccessVideoEvent(
                                      item.id.toString(),
                                      this.context,
                                      LiveScreen(
                                        linkLive: Provider.of<UserProvider>(
                                                context,
                                                listen: false)
                                            .link,
                                        level: widget.level,
                                        term: widget.term,
                                        color: widget.color,
                                      ),
                                      widget.unitId,
                                      widget.level,
                                      widget.price));
                              });
                              

                              // }

                            }
                          },
                          child: CardWatch(
                            videoData: item,
                            index: index,
                          ),
                        ),
                      );
                    },
                  )),
            )

            // Container(child:
            //     BlocBuilder<UserBloc, BlocStates>(builder: (context, state) {
            //   if (state is TasksLoadingState) {
            //     return Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   } else if (state is EmptyTasksState) {
            //     return Center(
            //       child: Text('Empty Tasks'),
            //     );
            //   } else if (state is TasksErrorState) {
            //     return Center(
            //       child: Text(state.error),
            //     );
            //   } else if (state is VideoState) {
            //     List<VideoData> videoData = state.data;
            //     // List<VideoData> videoDataOfline = videoData
            //     //     .where((element) => element.type == "OFFLINE")
            //     //     .toList();
            //     List<VideoData> videoDataFiltter = videoData
            //         .where((element) =>
            //             element.levelId == int.parse(widget.level) &&
            //             element.unitId == widget.unitId)
            //         .toList();
            //     // BlocProvider.of<UserBloc2>(context).add(SetVideoEvent2(
            //     //     "https://api.pythagorath.com/storage/videos/${videoDataOfline[0].path}"));

            //     // videoOfline =
            //     //     "https://api.pythagorath.com/storage/videos/${videoDataOfline[0].path}";
            //     // setState(() {

            //     // });

            //     return videoDataFiltter.isEmpty
            //         ? Container(
            //             child: Center(
            //               child: Text("No Video"),
            //             ),
            //           )
            //         : Column(
            //             children: [
            //               Text(
            //                 widget.title,
            //                 style: styleTitleDetails.copyWith(fontSize: 12),
            //               ),
            //               Text(
            //                 widget.desTitle,
            //                 style: styleTitleAppBarYears.copyWith(
            //                     color: deepGreenColor),
            //               ),
            //               SizedBox(
            //                 height: ScreenUtil().setHeight(12),
            //               ),
            //               Container(
            //                   height: ScreenUtil().setHeight(400),
            //                   width: double.infinity,
            //                   child: ListView.builder(
            //                     itemCount: videoDataFiltter.length,
            //                     itemBuilder: (context, index) {
            //                       return InkWell(
            //                           onTap: () {
            //                             videoPlayerCont.pause();
            //                             //  _videoPlayerController2.pause();
            //                             // if (videoData[index].status == "PAID") {
            //                             //    showDialog(
            //                             //     context: context,
            //                             //     builder: (context) {
            //                             //       return CardPaymentDialog();
            //                             //     },
            //                             //   );

            //                             // }else{
            //                             if (videoDataFiltter[index].type ==
            //                                 "OFFLINE") {
            //                               BlocProvider.of<UserBloc>(
            //                                       this.context)
            //                                   .add(IsAccessVideoEvent(
            //                                       videoDataFiltter[index]
            //                                           .id
            //                                           .toString(),
            //                                       this.context,
            //                                       WatchClasses2(
            //                                         unitId: widget.unitId,
            //                                         level: widget.level,
            //                                         term: widget.term,
            //                                         videoUrl:
            //                                             "${videoDataFiltter[index].videoAccessUrl}",
            //                                         title:
            //                                             videoDataFiltter[index]
            //                                                 .title,
            //                                         desTitle:
            //                                             videoDataFiltter[index]
            //                                                 .description,
            //                                       ),
            //                                       widget.unitId,
            //                                       widget.level,
            //                                       widget.price));
            //                               // Provider.of<AuthProviderUser>(context,
            //                               //         listen: false)
            //                               //     .setVideoOflineUrl(
            //                               //         'https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4');
            //                               // push(
            //                               //     context,
            //                               //     WatchClasses(
            //                               //       level: widget.level,
            //                               //       term: widget.term,
            //                               //     ));
            //                               // BlocProvider.of<UserBloc2>(context).add(SetVideoEvent2(
            //                               // null));
            //                               // BlocProvider.of<UserBloc2>(context).add(
            //                               //     SetVideoEvent2(
            //                               //         'https://www.sample-videos.com/video123/mp4/240/big_buck_bunny_240p_1mb.mp4'));
            //                               // push(
            //                               //     context,
            //                               //     WatchClasses(
            //                               //       level: widget.level,
            //                               //       term: widget.term,
            //                               //     ));

            //                             } else {
            //                               // BlocProvider.of<UserBloc>(this.context).add(
            //                               //     UnitEvent(widget.term, widget.level));
            //                               Provider.of<UserProvider>(context,
            //                                       listen: false)
            //                                   .getVideoAccess(
            //                                       videoDataFiltter[index]
            //                                           .id
            //                                           .toString());
            //                               BlocProvider.of<UserBloc>(
            //                                       this.context)
            //                                   .add(IsAccessVideoEvent(
            //                                       videoDataFiltter[index]
            //                                           .id
            //                                           .toString(),
            //                                       this.context,
            //                                       LiveScreen(
            //                                         linkLive: Provider.of<
            //                                                     UserProvider>(
            //                                                 context,
            //                                                 listen: false)
            //                                             .link,
            //                                         level: widget.level,
            //                                         term: widget.term,
            //                                         color: widget.color,
            //                                       ),
            //                                       widget.unitId,
            //                                       widget.level,
            //                                       widget.price));

            //                               // }

            //                             }
            //                           },
            //                           child: SlideInRight(
            //                               animate: true,
            //                               duration: Duration(
            //                                   milliseconds:
            //                                       1000 + (300 * index)),
            //                               child: Container(
            //                                 margin: EdgeInsets.only(
            //                                     bottom:
            //                                         ScreenUtil().setHeight(10)),
            //                                 child: CardWatch(
            //                                   videoData:
            //                                       videoDataFiltter[index],
            //                                   index: index,
            //                                 ),
            //                               )));
            //                     },
            //                   ))
            //             ],
            //           );
            //   }
            //   return Container();
            // })),
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
    );
  }
}
