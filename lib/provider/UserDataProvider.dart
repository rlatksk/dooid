import 'package:flutter/foundation.dart';

class UserDataProvider extends ChangeNotifier {
  String firstname = "";
  String lastname = "";
  String phone = "";
  String pin = "";
  String photo = "";
  String bday = "";
  String email = "";

  void setUserName(String firstName) {
    firstname = firstName;
    notifyListeners();
  }

  void setUserLastName(String lastName) {
    lastname = lastName;
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
  void setUserBirthday(String birthDay) {
    bday = birthDay;
    notifyListeners();
  }

  void setUserEmail(String eMail) {
    email = eMail;
    notifyListeners();
  }
}
