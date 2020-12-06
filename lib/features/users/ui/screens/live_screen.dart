import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:pythagoras/components/models/unit.dart';
import 'package:pythagoras/features/users/providers/auth_providers_user.dart';
import 'package:pythagoras/features/users/ui/screens/watch_classes.dart';
import 'package:pythagoras/features/users/ui/widgets/card_details.dart';
import 'package:pythagoras/features/users/ui/widgets/card_title_man.dart';
import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/constants.dart';
import 'package:pythagoras/values/images_name.dart';
import 'package:pythagoras/values/styles.dart';

class LiveScreen extends StatefulWidget {
  String linkLive;
  String level;
  String term;
  LiveScreen({this.linkLive, this.level, this.term});
  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  InAppWebViewController _webViewController;

  isBob(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(VideoEvent());
    return true;
  }

  @override
  Widget build(BuildContext context) {
    print("rmxiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii ${widget.linkLive}");
    BlocProvider.of<UserBloc>(context)
        .add(UnitEvent(widget.term, widget.level));
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        // actions: [
        //   IconButton(
        //       icon: Icon(
        //         Icons.notifications,
        //         size: 25,
        //         color: whiteColor,
        //       ),
        //       onPressed: () {})
        // ],
        //   leading: Icon(Icons.share),
        backgroundColor: deepBlueColor2,
        title: Column(
          children: [
            Image.asset(
              'assets/images/qwd.png',
              fit: BoxFit.fill,
            ),
            Text("متعة تعلم الرياضيات", style: styleSubLogoLight),
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
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Container(
                width: double.infinity,
                child: CardTitleMan(
                    title: Provider.of<AuthProviderUser>(context).titleLive,
                    subTitle1:
                        Provider.of<AuthProviderUser>(context).subTitleLive,
                    subTitle2:
                        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد ",
                    color: deepBlueColor2),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),

              widget.linkLive != null || widget.linkLive != ""
                  ? Container(
                      decoration: BoxDecoration(borderRadius: borderRadius8),
                      height: ScreenUtil().setHeight(400),
                      width: ScreenUtil().setWidth(332),
                      child: InAppWebView(
                        initialData: InAppWebViewInitialData(data: """
<!doctype html>
<html lang="en">
    <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
          <title>Flutter InAppBrowser</title>
    </head>
    <body>
      ${widget.linkLive}
    </body>
</html>"""),
                        initialHeaders: {},
                        initialOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                          debuggingEnabled: true,
                        )),
                        onWebViewCreated: (InAppWebViewController controller) {
                          _webViewController = controller;
                        },
                        onLoadStart:
                            (InAppWebViewController controller, String url) {
                              
                        },
                        onLoadStop:
                            (InAppWebViewController controller, String url) {},
                        onConsoleMessage: (InAppWebViewController controller,
                            ConsoleMessage consoleMessage) {
                          print("console message: ${consoleMessage.message}");
                        },
                      ),
                    )
                  : Container(
                      child: Center(
                        child: Text("No Video"),
                      ),
                    ),

              // SizedBox(
              //   height: ScreenUtil().setHeight(20),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //         width: ScreenUtil().setWidth(75),
              //         child: Divider(
              //           thickness: 2,
              //           endIndent: 20,
              //         )),
              //     Text(
              //       "الدروس المسجلة",
              //       style: styleTitleSignUpLight,
              //     ),
              //     Container(
              //         width: ScreenUtil().setWidth(75),
              //         child: Divider(
              //           thickness: 2,
              //           endIndent: 20,
              //         ))
              //   ],
              // ),
              // SizedBox(
              //   height: ScreenUtil().setHeight(5),
              // ),
              // Container(
              //   height: ScreenUtil().setHeight(646),
              //   width: double.infinity,
              //   child: BlocBuilder<UserBloc, BlocStates>(
              //     builder: (context, state) {
              //       if (state is TasksLoadingState) {
              //         return Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       } else if (state is EmptyTasksState) {
              //         return Center(
              //           child: Text('Empty Tasks'),
              //         );
              //       } else if (state is TasksErrorState) {
              //         return Center(
              //           child: Text(state.error),
              //         );
              //       } else if (state is UnitState) {
              //         List<UnitData> unitdata = state.data;
              //         return ListView.builder(
              //           itemCount: unitdata.length,
              //           itemBuilder: (context, index) {
              //             return Directionality(
              //                 textDirection: TextDirection.rtl,
              //                 child: InkWell(
              //                     onTap: () {
              //                       BlocProvider.of<UserBloc>(context)
              //                           .add(VideoEvent());
              //                       push(context, WatchClasses());
              //                     },
              //                     child: CardDetails(
              //                       unitdata: unitdata[index],
              //                     )));
              //           },
              //         );
              //       }
              //     },
              //   ),
              // )
              // Directionality(
              //     textDirection: TextDirection.rtl, child: CardDetails()),
              // SizedBox(
              //   height: ScreenUtil().setHeight(5),
              // ),
              // Directionality(
              //     textDirection: TextDirection.rtl, child: CardDetails()),
            ],
          ),
        ),
      ),
    );
  }
}
