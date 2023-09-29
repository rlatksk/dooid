import 'package:dooid/data/profile.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contacts;

  ContactProvider(this.contacts);

  void addTransactionToContact(int contactIndex, Transaction transaction) {
    contacts[contactIndex].addTransaction(transaction);
    notifyListeners();
  }

  void changeProfilePicture(int contactIndex, String newProfilePicture) {
    contacts[contactIndex].changeProfilePicture(newProfilePicture);
    notifyListeners();
  }

  void changePin(int contactIndex, String newPin) {
    contacts[contactIndex].changePin(newPin);
    notifyListeners();
  }

  void changeEmail(int contactIndex, String newEmail) {
    contacts[contactIndex].changeEmail(newEmail);
    notifyListeners();
  }
}
