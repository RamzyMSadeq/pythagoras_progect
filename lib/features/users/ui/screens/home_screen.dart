
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:pythagoras/components/models/notification_model.dart';
import 'package:pythagoras/features/users/providers/auth_providers_user.dart';
import 'package:pythagoras/features/users/ui/screens/classes_screen2.dart';
import 'package:pythagoras/features/users/ui/widgets/custom_bottom.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/constants.dart';
import 'package:pythagoras/values/images_name.dart';
import 'package:pythagoras/values/styles.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController controller;
  Future<void> initializeVideo;
  DateTime currentBackPressTime;

  //String iframeUrl = "https://www.youtube.com/watch/embed/IdbyTjI1ZFo";
  YoutubePlayerController _controller;

  InAppWebViewController webView;

  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(NotificationEvent());
    super.initState();
  }

  // @override
  // void initState() {
  //   _controller = YoutubePlayerController(
  //   initialVideoId: Provider.of<AuthProviderUser>(context).initialVideo,
  //   flags: YoutubePlayerFlags(
  //     autoPlay: false,
  //     // mute: true,
  //   ),
  // );
  //   super.initState();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: "اضغط مره اخرى للخروج",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: orangeColor,
          textColor: Colors.white,
          fontSize: 16.0);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    _controller = YoutubePlayerController(
      initialVideoId: Provider.of<AuthProviderUser>(context).initialVideo,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        // mute: true,
      ),
    );
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: whiteColor,
          body: WillPopScope(
            onWillPop: onWillPop,
            child: Container(
              padding: EdgeInsets.all(30),
              height: double.infinity,
              width: double.infinity,
              child: ListView(
                children: [
                  Text(
                    "فيديو توضيحي للتطبيق",
                    style: styleTitleSignUp,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: borderRadius8),
                    height: ScreenUtil().setHeight(200),
                    width: ScreenUtil().setWidth(332),
                    child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        progressColors: ProgressBarColors(
                          playedColor: Colors.amber,
                          handleColor: Colors.amberAccent,
                        )

                        // onReady () {
                        //     _controller.addListener(listener);
                        // },
                        ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(202),
                    child: CustomBottom(
                      color: orangeColor,
                      title: "إبدأ الان",
                      route: () async {
                        BlocProvider.of<UserBloc>(context).add(LevelsEvent());
                        

                        _controller.pause();

                        push(context, ClassesScreen2());
                      },
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(200),
                    width: ScreenUtil().setWidth(308),
                    child: SvgPicture.asset(
                      homeimage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(20),
                  ),
                  Container(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "باستخدام :",
                          style: styleTitleSignUp,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        Text(
                          "طريقة الدروس المسجلة",
                          style: styleTitleSignUp,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        Text(
                          "طريقة الدروس المباشرة",
                          style: styleTitleSignUp,
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        Text(
                          "تعلم الرياضيات معنا",
                          style: styleTitleSignUp.copyWith(fontSize: 11),
                        ),
                        BlocBuilder<UserBloc, BlocStates>(
                          builder: (context, state) {
                            if (state is TasksLoadingState) {
                              return Center(
                                  // child: CircularProgressIndicator(),
                                  );
                            } else if (state is EmptyTasksState) {
                              return Center(
                                  //child: Text('Empty Tasks'),
                                  );
                            } else if (state is TasksErrorState) {
                              return Center(
                                  //  child: Text(state.error),
                                  );
                            } else if (state is NotificationState) {
                              Notification1 notification = state.notification1;
                              List<DataNotification> myNotification =
                                  notification.data;
                              Provider.of<AuthProviderUser>(context)
                                  .setCountNotification(myNotification.length);
                            }
                            return Container();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
