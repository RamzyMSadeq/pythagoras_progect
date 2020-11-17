import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:pythagoras/components/models/levels.dart';
import 'package:pythagoras/components/models/me_user.dart';
import 'package:pythagoras/components/models/unit.dart';
import 'package:pythagoras/components/models/user_data.dart';
import 'package:pythagoras/components/models/video.dart';
import 'package:pythagoras/features/users/repo/api_user_client.dart';
import 'package:pythagoras/components/models/notification_model.dart';

class ApiRepositoryUser {
  ApiRepositoryUser._();

  static ApiRepositoryUser apiRepositoryUser = ApiRepositoryUser._();

  Future<UserData> registerUser(
      String name,
      String gender,
      String password,
      String mobile,
      String levelId,
      String location,
      String supervisor,
      String supervisorType,
      File avatar) async {
    try {
      Map map = await ApiUserClient.apiUserClient.registerUser(
          name,
          gender,
          password,
          mobile,
          levelId,
          location,
          supervisor,
          supervisorType,
          avatar);
      UserData user = UserData.fromJson(map);

      return user;
    } catch (e) {
      return null;
    }
  }

  // Future<TokenData> logInUser(
  //   String mobile,
  //   String password,
  // ) async {
  //   try {
  //     Map map = await ApiUserClient.apiUserClient.logInUser(mobile, password);
  //     TokenData tokenData = TokenData.fromJson(map);

  //     return tokenData;
  //   } catch (e) {
  //     return null;
  //   }
  // }

  Future<MeUser> meUser() async {
    try {
      Map map = await ApiUserClient.apiUserClient.meUser();
       

      MeUser meUser = MeUser.fromJson(map);
      print('my users $meUser');
      return meUser;
    } catch (e) {
      return null;
    }
  }

  Future<Levels> levels() async {
    try {
      Map map = await ApiUserClient.apiUserClient.levels();
           print('my map $map');

      Levels levels = Levels.fromJson(map);
     print('my levels $levels');
      return levels;
    } catch (e) {
      return null;
    }
  }

  Future<Unit> unit(String term, String level) async {
    try {
      Map map = await ApiUserClient.apiUserClient.unitsUser(term, level);
      Unit unit = Unit.fromJson(map);

      return unit;
    } catch (e) {
      return null;
    }
  }

  Future<Video> videoUser() async {
    try {
      Map map = await ApiUserClient.apiUserClient.videosUser();
      Video video = Video.fromJson(map);

      return video;
    } catch (e) {
      return null;
    }
  }



   Future<Notification1> allNotification() async {
    try {
      Map map = await ApiUserClient.apiUserClient.allNotification();
      Notification1 notification1 = Notification1.fromJson(map);

      return notification1;
    } catch (e) {
      return null;
    }
  }
}
