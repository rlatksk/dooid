import 'package:flutter/foundation.dart';
import 'UserDataModel.dart';

class UserDataProvider extends ChangeNotifier {
  UserDataModel? _userData;

  UserDataModel? get userData => _userData;

  void setUserData(String? firstname, String? pin) {
    _userData = UserDataModel(firstname: firstname, pin: pin);
    notifyListeners();
  }
}
