import 'package:get/get.dart';
import 'package:pythagoras/features/users/repo/api_user_client.dart';

class AppGet extends GetxController {
  int countNotificationfet = 0;
  int countNotificationfetSp = 0;
  int blocked;
  int term;
  String initialVideo = "IdbyTjI1ZFo";
  String titlePay = "";
  String subTitlePay = "";
  String titleLive = "";
  String subTitleLive = "";
  var allMeStatus = {}.obs;
  var allSettings = {}.obs;

  setInitialVideo(String value) {
    this.initialVideo = value;
    print("ttttrrrrrrrrrrrrrrrrrrrrrrrrrr $initialVideo");
  }

 settitlePay(String value) {
    this.titlePay = value;
  }

  setsubTitlePay(String value) {
    this.subTitlePay = value;
  }

  settitleLive(String value) {
    this.titleLive = value;
  }

  setsubTitleLive(String value) {
    this.subTitleLive = value;
  }

  setTerm(int value) {
    this.term = value;
    update(['term']);
  }

  setCountNotifi(int value) {
    this.countNotificationfet = value;
    update(['notifi']);
  }

  setCountNotifiSp(int value) {
    this.countNotificationfetSp = value;
    // update(['notifi']);
  }

  setBolcked(int value) {
    this.blocked = value;
  }

  /////////////////////////////////////////////

  getAllMeStatus() async {
    try {
      Map map = await ApiUserClient.apiUserClient.meStatusUser();
      allMeStatus.value = map;
    } catch (e) {
      print("ddddddddddddddd $e");
    }
  }
  /////////////////////////////////////////////

  getAllSettings() async {
    try {
      Map map = await ApiUserClient.apiUserClient.settingsUser();
      allSettings.value = map;
    } catch (e) {
      print("ddddddddddddddd $e");
    }
  }
}
