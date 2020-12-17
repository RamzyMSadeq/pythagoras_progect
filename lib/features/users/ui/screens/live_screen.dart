import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_events.dart';

import 'package:pythagoras/values/borders.dart';
import 'package:pythagoras/values/colors.dart';
import 'package:pythagoras/values/constants.dart';
import 'package:pythagoras/values/images_name.dart';
import 'package:pythagoras/values/styles.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class LiveScreen extends StatefulWidget {
  String linkLive;
  String level;
  String term;
  Color color;
  LiveScreen({this.linkLive, this.level, this.term  , this.color});
  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  InAppWebViewController webViewController;
  // final Completer<WebViewController> _controllerW =
  //     Completer<WebViewController>();
  // WebViewController webViewController1;

  isBob(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(VideoEvent());
    return true;
  }

  String finalV = '';

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  //  if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  // _onNavigationDelegateExample(
  //     WebViewController controller, BuildContext context, String data) async {
  //   final String contentBase64 =
  //       base64Encode(const Utf8Encoder().convert(data));
  //   this.finalV = 'data:text/html;base64,$contentBase64';
  //   setState(() {
      
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print("rmxiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii ${widget.linkLive}");

    String dataBr = """${widget.linkLive}""";

   // _onNavigationDelegateExample(webViewController1, context, dataBr);
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
        backgroundColor: widget.color,
        title: Column(
          children: [
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
      body: WillPopScope(
        onWillPop: () async {
          return isBob(context);
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: widget.linkLive != null || widget.linkLive != ""
              ? Container(
                  decoration: BoxDecoration(borderRadius: borderRadius8),
                  height: ScreenUtil().setHeight(400),
                  width: ScreenUtil().setWidth(332),
                  child: 
                  InAppWebView(
                    
                    
                initialData: InAppWebViewInitialData(
                  data: """${widget.linkLive}""",
                ),
                initialHeaders: {},
                androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                        return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                      },
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                  debuggingEnabled: true,
                  userAgent:  "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36",
                  mediaPlaybackRequiresUserGesture: true
                )),
                onWebViewCreated: (InAppWebViewController controller) {
                  webViewController = controller;
                  
                },
                onLoadStart:
                    (InAppWebViewController controller, String url) {},
                onLoadStop:
                    (InAppWebViewController controller, String url) {},
                onConsoleMessage: (InAppWebViewController controller,
                    ConsoleMessage consoleMessage) {
                  print("console message: ${consoleMessage.message}");
                },
              ),

                  // WebView(
                  //   initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
                  //   userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36",
                  //   initialUrl: finalV,
                  //   javascriptMode: JavascriptMode.unrestricted,
                  //   onWebViewCreated: (WebViewController webViewController) {

                  //     webViewController1 = webViewController;
                      
                  //   },

                  // ),
                )
              // InAppWebView(
              //   initialData: InAppWebViewInitialData(
              //     data: """${widget.linkLive}""",
              //   ),
              //   initialHeaders: {},
              //   initialOptions: InAppWebViewGroupOptions(
              //       crossPlatform: InAppWebViewOptions(
              //     debuggingEnabled: true,
              //   )),
              //   onWebViewCreated: (InAppWebViewController controller) {
              //     _webViewController = controller;
              //   },
              //   onLoadStart:
              //       (InAppWebViewController controller, String url) {},
              //   onLoadStop:
              //       (InAppWebViewController controller, String url) {},
              //   onConsoleMessage: (InAppWebViewController controller,
              //       ConsoleMessage consoleMessage) {
              //     print("console message: ${consoleMessage.message}");
              //   },
              // ),

              : Container(
                  child: Center(
                    child: Text("No Video"),
                  ),
                ),
        ),
      ),
    );
  }
}
