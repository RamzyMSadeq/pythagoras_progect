import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pythagoras/components/models/levels.dart';
import 'package:pythagoras/components/models/me_user.dart';
import 'package:pythagoras/components/models/notification_model.dart';
import 'package:pythagoras/components/models/token_data.dart';
import 'package:pythagoras/components/models/unit.dart';
import 'package:pythagoras/components/models/user_data.dart';
import 'package:pythagoras/components/models/video.dart';
import 'package:pythagoras/features/users/providers/auth_providers_user.dart';
import 'package:pythagoras/features/users/repo/api_user_client.dart';
import 'package:pythagoras/features/users/repo/api_user_repo.dart';
import 'package:pythagoras/features/users/ui/screens/confirm_phone_screen.dart';
import 'package:pythagoras/features/users/ui/screens/home_screen.dart';
import 'package:pythagoras/features/users/ui/screens/log_in_screen.dart';
import 'package:pythagoras/features/users/ui/screens/setting_screen.dart';
import 'package:pythagoras/features/users/ui/screens/update_password.dart';
import 'package:pythagoras/features/users/ui/screens/verification_phone_screen.dart';
import 'package:pythagoras/features/users/ui/widgets/card_payment-dialog.dart';
import 'package:pythagoras/values/constants.dart';

import 'bloc_events.dart';
import 'bloc_states.dart';

class UserBloc extends Bloc<BlocEvents, BlocStates> {
  UserBloc(BlocStates initialState) : super(initialState);
  UserData userData;
  TokenData tokenData;
  Levels allLevels;
  Unit allUnit;
  Video allVideo;
  MeUser meUser;
  String videoIni;
  Map allSettings;
  Notification1 allNotificaton;

  ///////////////////////////////////////////////////
  Future<Levels> getAllLevels() async {
    if (allLevels == null) {
      print("11111111111111111111111111111");
      Levels levels = await ApiRepositoryUser.apiRepositoryUser.levels();
      print("1111111122222222222222222222222221");
      allLevels = levels;
      return levels;
    } else {
      return allLevels;
    }
  }

///////////////////////////////////////////////////
  Future<Unit> getAllUnit(String term, String level) async {
    if (allUnit == null) {
      Unit unit = await ApiRepositoryUser.apiRepositoryUser.unit(term, level);
      allUnit = unit;
      return unit;
    } else {
      return allUnit;
    }
  }

///////////////////////////////////////////////////
  Future<Video> getAllVideo() async {
    if (allVideo == null) {
      Video video = await ApiRepositoryUser.apiRepositoryUser.videoUser();
      allVideo = video;
      return video;
    } else {
      return allVideo;
    }
  }

///////////////////////////////////////////////////
  Future<MeUser> getMeUser() async {
    if (meUser == null) {
      MeUser user1 = await ApiRepositoryUser.apiRepositoryUser.meUser();
      meUser = user1;
      return user1;
    } else {
      return meUser;
    }
  }

  ///////////////////////////////////////////
  Future<Map> getAllSetting() async {
    if (allSettings == null) {
      Map settings = await ApiUserClient.apiUserClient.settingsUser();
      allSettings = settings;
      return settings;
    } else {
      return allSettings;
    }
  }

  ///////////////////////////////////////////
  // Future<Notification1> getAllNotification() async {
  //   if (allNotificaton == null) {
  //     Notification1 notification =
  //         await ApiRepositoryUser.apiRepositoryUser.allNotification();
  //     allNotificaton = notification;
  //     return notification;
  //   } else {
  //     return allNotificaton;
  //   }
  // }
  // Future<List<Task>> getAllTasks() async {
  //   if (allTasks == null) {
  //     List<Task> tasks = await DBHelper.dbHelper.getAllTasks();
  //     allTasks = tasks;
  //     return tasks;
  //   } else {
  //     return allTasks;
  //   }
  // }

  @override
  Stream<BlocStates> mapEventToState(BlocEvents event) async* {
    // if (event is GetAllTasksEvent) {
    //   yield TasksLoadingState();
    //   List<Task> tasks = await getAllTasks();
    //   if (tasks.isEmpty) {
    //     yield EmptyTasksState();
    //   } else {
    //     yield TasksLoadedState(tasks);
    //   }
    // }
    // ////////////////////////////////////////////////////////////////////
    if (event is LogInEvent) {
      try {
        yield TasksLoadingState();
        Map login = await ApiUserClient.apiUserClient
            .loginUser2(event.mobile, event.password);
        String token = login["access_token"];
        print("i89999911111111111111112222222222222");
        if (login["message"] == "success") {
          print("dooooooooooooooooooooooone $token");
          yield UserLogedInState(token);
        } else {
          print("errrrrrrrrrrrrrrrrrrrrrrrrrrror 88888888888888555555555");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }
    ////////////////////////////////////////////////////////////////////
    if (event is RegisterUserEvent) {
      try {
        yield TasksLoadingState();
        Map user = await ApiUserClient.apiUserClient.registerUser(
            event.name,
            event.gender,
            event.password,
            event.mobile,
            event.levelId,
            event.location,
            event.supervisor,
            event.supervisorType,
            event.avatar);

        if (user['message'] == "User successfully registered") {
          yield SuccessState();
          push(event.context, LogInScreen());
          Fluttertoast.showToast(
              msg: "تم انشاء حساب بنجاح",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          print("Done Register ${user['message']}");
        } else {
          yield TasksErrorState("غير موجود");
          print("EEEEEErrrrooooooooor222222222222222222222222222");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }
    // ///////////////////////////////////////////////////////////////////
    if (event is LogOutEvent) {
      try {
        yield TasksLoadingState();
        Map map = await ApiUserClient.apiUserClient
            .logOutUser(event.mobile, event.password);
        if (map["message"] == "Successfully logged out") {
          yield UserLogedOutState(map["message"]);
        }
        UserLogedOutState(map["message"]);
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }
    // ///////////////////////////////////////////////////////////////////

    if (event is MeUserEvent) {
      try {
        yield TasksLoadingState();
        MeUser user2 = await getMeUser();
        if (user2.name != "") {
          yield MeUserState(user2);
          print("Done Me User ${user2.name}");
        } else {
          print("EEEEEErrrrooooooooor333333333333333333333");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }
    ////////////////////////////////////////////////////
    if (event is ResetEvent) {
      try {
        yield TasksLoadingState();
        Map map =
            await ApiUserClient.apiUserClient.passwordResetUser(event.mobile);
        if (map["message"] == "success") {
          print("ghghghghghghghhhhhhhhhhhhhhhhhhhhhhhhh ${map["status"]}");

          yield ResetState(map["status"]);
          pushReplecment(event.context, VerificationPhoneScreen());
          Fluttertoast.showToast(
              msg: "تم ارسال رمز التفعيل",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          print("EEEEEErrrrooooooooor4444444444444444444444");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }

    //////////////////////////////////////////////
    if (event is ResetPasswordConfirmEvent) {
      try {
        yield TasksLoadingState();
        Map map = await ApiUserClient.apiUserClient
            .resetPasswordConfirmUser(event.mobile, event.code);
        if (map["token"] != null) {
          yield ResetPasswordConfirmState(map["status"], map["token"]);
          pushAndRemoveUntil(event.context, UpdatePassword());
        } else {
          print("EEEEEErrrrooooooooor555555555555");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }

    ///////////////////////////////////////
    ///
    if (event is ResetPasswordConfirmUpdateEvent) {
      try {
        yield TasksLoadingState();
        Map map = await ApiUserClient.apiUserClient
            .resetPasswordConfirmUpdateUser(
                event.mobile, event.token, event.password);
        if (map["status"] == "success") {
          yield ResetPasswordConfirmUpdateState(map["status"]);
          pushAndRemoveUntil(event.context, LogInScreen());
          Fluttertoast.showToast(
              msg: "تم تعديل كلمة المرور",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          print("EEEEEErrrrooooooooor555555555555");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }

    //////////////////////////////////////////
    if (event is ConfirmPhoneEvent) {
      try {
        yield TasksLoadingState();
        Map map =
            await ApiUserClient.apiUserClient.confirmPhoneUser(event.code);
        if (map["status"] == "success") {
          print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk6666666666666666");
          yield ConfirmPhoneState(map["status"]);
          pushAndRemoveUntil(event.context, HomeScreen());
          Fluttertoast.showToast(
              msg: "تم تأكيد الحساب بنجاح",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        } else {
          print("EEEEEErrrrooooooooor6666666666666666");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }
    /////////////////////////////////////////
    if (event is LevelsEvent) {
      try {
        yield TasksLoadingState();
        Levels levels1 = await getAllLevels();
        print("fffffffggggggggggggg $levels1");
        if (levels1.data != null) {
          yield LevelsState(levels1.data);
        } else {
          print(
              "lllllllllleeeeeeeeeeeeeeeeeeeeeeeeeeeeeellllllllllllllllllllll");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }

    ////////////////////////////////////////////
    if (event is UnitEvent) {
      try {
        print("unit 11111111111111111111111111111111");
        yield TasksLoadingState();
        Unit unit1 = await ApiRepositoryUser.apiRepositoryUser
            .unit(event.term, event.level);
        if (unit1.data != null) {
          print("unit 2222222222222222222222222222222222222");
          print("unit ${unit1.data}");
          yield UnitState(unit1.data);
        } else {
          print("unit 33333333333333333333333333333333333");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }
    ////////////////////////////////////////
    if (event is VideoEvent) {
      try {
        yield TasksLoadingState();
        Video video1 = await getAllVideo();
        // Provider.of(context).setVideoOflineUrl("https://api.pythagorath.com/storage/videos/${videoDataOfline[0].path}");
        // List<VideoData> videoDataOfline =
        //     video1.data.where((element) => element.type == "OFFLINE").toList();
        if (video1.data != null) {
          // videoIni =
          //     "https://api.pythagorath.com/storage/videos/${videoDataOfline[0].path}";
          // yield SetVideoState(
          //     "https://api.pythagorath.com/storage/videos/${videoDataOfline[0].path}");
          yield VideoState(video1.data);
        } else {
          print("bbbbbbbbbbbbbbbbbbbbbbbnnnnnnnnnnnnnn");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }

    ////////////////////////////////////////

    ////////////////////////////////////////
    if (event is VideoViewEvent) {
      try {
        yield TasksLoadingState();
        String video = await ApiUserClient.apiUserClient.videwView(event.id);
        if (video != null) {
          yield VideoViewState(video);
        } else {
          print("bbbbbbbbbbbbbbbbbbbbbbbnnnnnnnnnnnnnn");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }

    if (event is OrderPaymebtEvent) {
      try {
        yield TasksLoadingState();
        Map map = await ApiUserClient.apiUserClient
            .orderPaymentUser(event.type, event.unitId);
        if (map["status"] == true) {
          yield OrderPaymentState(map["redirect"]);
        } else {
          print("ppppppppppppppppppppeeeeeeeeeeeeeeeeeeeeeeeeeee");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }

    //////////////////////////////////////////
    if (event is MeStatusEvent) {
      try {
        yield TasksLoadingState();
        Map map = await ApiUserClient.apiUserClient.meStatusUser();
        if (map["phoneVerified"] != 2) {
          yield MeStatusState(
              map["isAdmin"], map["phoneVerified"], map["blocked"]);
          if (map["phoneVerified"] == 1) {
            print(
                "mnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
            pushAndRemoveUntil(event.context, HomeScreen());
          } else {
            print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
            push(event.context, ConfirmPhoneScreen());
          }
        } else {
          print("EEEEEErrrrooooooooor6666666666666666");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }

    //////////////////////////////////////////
    if (event is CallMeEvent) {
      try {
        yield TasksLoadingState();
        Map map = await ApiUserClient.apiUserClient.callMe();
        if (map["message"] != null) {
          yield CallMeState(map["message"]);
          // Navigator.of(event.context).pop();
        } else {
          print("EEEEEErrrrooooooooor6666666666666666");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }

    //////////////////////////////////////////
    if (event is EditProfileEvent) {
      try {
        yield TasksLoadingState();
        print("oopppppppppppppppppppyyyyyyyyyyyyyyyyyyrrrrrrrrrrrrr");
        Map map = await ApiUserClient.apiUserClient.editProfile(
            event.name,
            event.gender,
            event.levelId,
            event.location,
            event.supervisor,
            event.supervisorType,
            event.password,
            event.confirmPassword);
        if (map["message"] == "success") {
          yield EditProfileState(map["message"]);
            Fluttertoast.showToast(
              msg: "تم تعديل البيانات بنجاح",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          pushAndRemoveUntil(event.context, SettingScreen());
        } else {
          print("EEEEEErrrrooooooooor6666666666666666");
        }
      } catch (e) {
        print("oo222222222222222222222222222yyyyyyyyyyyyyyyyyrrrrrrrrrrrrr");
        yield TasksErrorState(e.toString());
      }
    }

    //////////////////////////////////////////
    if (event is IsAccessVideoEvent) {
      try {
        yield TasksLoadingState();
        String map = await ApiUserClient.apiUserClient.isAccessVideo(
          event.videoId,
        );
        if (map == "1") {
          yield EditProfileState(map);
          push(event.context, event.route);
        } else {
          showDialog(
            context: event.context,
            builder: (context) {
              return CardPaymentDialog(
                unitId: event.unitId,
                level: event.level,
              );
            },
          );
          print("EEEEEErrrrooooooooor6666666666666666");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }

    /////////////////////////////////////////
    if (event is SettingsEvent) {
      try {
        yield TasksLoadingState();
        Map data1 = await getAllSetting();
        if (data1 != null) {
          yield SettingsState(data1);
        } else {}
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }

    /////////////////////////////////////////
    if (event is NotificationEvent) {
      try {
        yield TasksLoadingState();
        Notification1 data1 =
            await ApiRepositoryUser.apiRepositoryUser.allNotification();
        if (data1 != null) {
          yield NotificationState(data1);
        } else {
          print(
              "lllllllllleeeeeeeeeeeeeeeeeeeeeeeeeeeeeellllllllllllllllllllll");
        }
      } catch (e) {
        yield TasksErrorState(e.toString());
      }
    }
  }
}
