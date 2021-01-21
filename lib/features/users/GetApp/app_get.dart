import 'package:get/get.dart';

class AppGet extends GetxController {
  int countNotificationfet = 0;
  int countNotificationfetSp = 0;
  int blocked ;
  int term ;


  
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
}
