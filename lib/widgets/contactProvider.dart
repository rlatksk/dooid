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

  List<Transaction> getRecentTransactions(int contactIndex, int count) {
    final contact = contacts[contactIndex];
    final transactions = contact.transactions ?? [];
    return transactions.length <= count
        ? transactions
        : transactions.sublist(transactions.length - count);
  }

  List<Transaction> getFrequentTransferTransactions(
      Contact contact, int count) {
    final transactions = contact.transactions ?? [];
    Map<String, int> transactionCount = {};

    for (Transaction transaction in transactions) {
      if (transaction.type == 'transfer') {
        transactionCount[transaction.name] =
            (transactionCount[transaction.name] ?? 0) + 1;
      }
    }

    List<String> sortedTransactionNames = transactionCount.keys.toList()
      ..sort((a, b) =>
          (transactionCount[b] ?? 0).compareTo(transactionCount[a] ?? 0));

    sortedTransactionNames.shuffle();

    List<Transaction> frequentTransferTransactions = [];
    for (String name in sortedTransactionNames) {
      if (frequentTransferTransactions.length < count) {
        frequentTransferTransactions.add(transactions.firstWhere(
          (transaction) =>
              transaction.name == name && transaction.type == 'transfer',
        ));
      } else {
        break;
      }
    }

    return frequentTransferTransactions;
  }
}
