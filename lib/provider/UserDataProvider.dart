import 'package:flutter/foundation.dart';

class UserDataProvider extends ChangeNotifier {
  String name = "";
  String phone = "";
  String pin = "";
  String photo = "";

  void setUserName(String firstName) {
    name = firstName;
    notifyListeners();
  }

  void setUserPhone(String phoneNumber) {
    phone = phoneNumber;
    notifyListeners();
  }

  void setUserPin(String securityPin) {
    pin = securityPin;
    notifyListeners();
  }

  void setUserPhoto(String profilepic) {
    photo = profilepic;
    notifyListeners();
  }
}
