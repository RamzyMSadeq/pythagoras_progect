import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pythagoras/bloc/bloc_class.dart';
import 'package:pythagoras/bloc/bloc_states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPayment extends StatefulWidget {
  var unitId;
  WebViewPayment({this.unitId});
  @override
  _WebViewPaymentState createState() => _WebViewPaymentState();
}

class _WebViewPaymentState extends State<WebViewPayment> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Paypal"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
            } else if (state is OrderPaymentState) {
              String redirect = state.redirect;
              print("ssssssssssssssssssssssssss $redirect");
              return WebView(
                initialUrl: "$redirect",
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}
