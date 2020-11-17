import 'package:flutter/material.dart';

push(BuildContext context, Widget page) {
  Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => page));
}

pushReplecment(BuildContext context, Widget page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => page));
}

pushAndRemoveUntil(BuildContext context, Widget page) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false);
}

final basePath = "https://api.pythagorath.com/api";
final videoPath = "http://api.pythagorath.com/storage/videos/";
final photoPath = "http://api.pythagorath.com/storage/avatars/";

final regesterPath = "/auth/register";
final logInPath = "/auth/login";
final meStatusPath = "/me-status";
final mePath = "/me";
final logOutPath = "/logout";
final confirmPhonePath = "/auth/confirm-phone";
final passwordResetPath = "/password/reset";
final resetPasswordConfirmPath = "/password/reset_password_confirm";
final resetPasswordConfirmUpdatePath =
    "/password/reset_password_confirm_update";
final levelsPath = "/levels";
final videosPath = "/videos";
final settingsPath = "/settings";
final statisticsPath = "/my/statistics";
final orderPaymentPath = "/payments";
final callMePath = "/me/request_a_call";
final editProfilePath = "/me/update";
final notificationPath = "/notifications";
