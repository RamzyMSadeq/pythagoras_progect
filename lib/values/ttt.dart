import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("\n\nBrowser Created!\n\n");
  }

  @override
  Future onLoadStart(String url) async {
    print("\n\nStarted $url\n\n");
  }

  @override
  Future onLoadStop(String url) async {
    print("\n\nStopped $url\n\n");
  }

  @override
  void onLoadError(String url, int code, String message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(int progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("\n\nBrowser closed!\n\n");
  }

  @override
  Future<ShouldOverrideUrlLoadingAction> shouldOverrideUrlLoading(
      ShouldOverrideUrlLoadingRequest shouldOverrideUrlLoadingRequest) async {
    print("\n\n override ${shouldOverrideUrlLoadingRequest.url}\n\n");
    return ShouldOverrideUrlLoadingAction.ALLOW;
  }

  @override
  void onLoadResource(LoadedResource response) {
    print("Started at: " +
        response.startTime.toString() +
        "ms ---> duration: " +
        response.duration.toString() +
        "ms " +
        response.url);
  }

  @override
  void onConsoleMessage(ConsoleMessage consoleMessage) {
    print("""
    console output:
      message: ${consoleMessage.message}
      messageLevel: ${consoleMessage.messageLevel.toValue()}
   """);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    new MyApp(),
  );
}

class MyApp extends StatefulWidget {
  final MyInAppBrowser browser = new MyInAppBrowser();

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InAppBrowser Example'),
        ),
        body: Center(
          child: RaisedButton(
              onPressed: () {
                
                widget.browser.openFile(
                    assetFilePath: "assets/index.html",
                    options: InAppBrowserClassOptions(
                        inAppWebViewGroupOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                      useShouldOverrideUrlLoading: true,
                      useOnLoadResource: true,
                    ))));
              },
              child: Text("Open InAppBrowser")),
        ),
      ),
    );
  }
}
