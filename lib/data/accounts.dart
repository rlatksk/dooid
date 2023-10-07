import 'package:dooid/widgets/shortcuts/format.dart';

class Transaction {
  String name;
  double amount;
  DateTime date;
  String? message;
  String type;

  Transaction({
    required this.name,
    required this.amount,
    required this.date,
    this.message,
    required this.type,
  });
}

class Contact {
  String firstName;
  String? lastName;
  String? profilePicture;
  double? balance;
  String countryCode;
  String phoneNumber;
  String pin;
  List<Transaction>? transactions;
  List<Transaction>? recentTransactions = [];

  Contact({
    required this.firstName,
    this.lastName,
    this.profilePicture,
    this.balance,
    required this.countryCode,
    required this.phoneNumber,
    required this.pin,
    this.transactions,
  }) {}

  void addTransaction(Transaction transaction) {
    transactions ??= [];
    transactions!.add(transaction);

    recentTransactions = transactions!.length > 5
        ? transactions!.sublist(transactions!.length - 5)
        : List.from(transactions!);

    updateBalance();
  }

  void changeProfilePicture(String? newProfilePicture) {
    profilePicture = newProfilePicture;
  }

  void changePin(String newPin) {
    pin = newPin;
  }

  void updateBalance() {
    balance = balance ?? 0.0;
    if (transactions != null && transactions!.isNotEmpty) {
      balance = balance! + transactions!.last.amount;
    }
  }

  double calculateTotalAmountForToday() {
    DateTime now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);
    DateTime todayEnd = todayStart.add(Duration(days: 1));

    double totalAmountSpent = 0.0;

    if (transactions != null) {
      for (Transaction transaction in transactions!) {
        if (transaction.date.isAfter(todayStart) &&
            transaction.date.isBefore(todayEnd)) {
          if (transaction.amount < 0) {
            totalAmountSpent += transaction.amount.abs();
          }
        }
      }
    }

    return totalAmountSpent;
  }

  String get name {
    String fullName = firstName;
    if (lastName != null && lastName!.isNotEmpty) {
      fullName +=
          ' $lastName'; 
    }
    return fullName;
  }

  String get completePhoneNumber {
    return '+$countryCode $phoneNumber';
  }

  String get displayProfilePicture {
    if (profilePicture != null && profilePicture!.isNotEmpty) {
      return profilePicture!;
    } else {
      final parts = name.split(' ');
      final firstInitial = parts.length > 0 ? parts[0][0] : '';
      final secondInitial = parts.length > 1 ? parts[1][0] : '';
      return '$firstInitial$secondInitial';
    }
  }
}

List<Contact> contacts = [
  Contact(
      firstName: 'Jason',
      lastName: 'Chainara Putra',
      profilePicture: 'assets/images/profile_pictures/jason.png',
      balance: 1000000000,
      countryCode: '62',
      phoneNumber: '8555123456',
      pin: '123456',
      transactions: [
        Transaction(
            name: 'Ruben Tobia Chaiyadi',
            amount: -17500175,
            date: DateTime(2023, 9, 3, 10, 15),
            message: 'test ahhhhhhhhhh',
            type: 'transfer'),
        Transaction(
            name: 'Richard Souwiko',
            amount: -3000000,
            date: DateTime(2023, 9, 3, 12, 45),
            message: 'bayar open bo',
            type: 'transfer'),
        Transaction(
            name: 'Top Up',
            amount: 50000000,
            date: DateTime(2023, 9, 3, 14, 20),
            message: 'Added Rp${formatBalance(50000000)}',
            type: 'topup'),
      ]),
  Contact(
    firstName: 'Ivander',
    profilePicture: 'assets/images/profile_pictures/ivander.png',
    balance: 987654321.0,
    countryCode: '81',
    phoneNumber: '9876543210',
    pin: '654321',
    transactions: [
      Transaction(
          name: 'Richard Souwiko',
          amount: -17500175,
          date: DateTime(2023, 9, 3, 10, 15),
          message: 'test ahhhhhhhhhh',
          type: 'transfer'),
      Transaction(
          name: 'Justin Salim',
          amount: 1500000,
          date: DateTime(2023, 9, 3, 12, 45),
          message: 'bayar open bo',
          type: 'transferred'),
      Transaction(
          name: 'Top Up',
          amount: 50000000,
          date: DateTime(2023, 9, 3, 14, 20),
          message: 'Added Rp${formatBalance(50000000)}',
          type: 'topup'),
      Transaction(
          name: 'Top Up',
          amount: 35000000,
          date: DateTime(2023, 9, 4, 8, 50),
          message: 'Added Rp${formatBalance(35000000)}',
          type: 'topup'),
      Transaction(
          name: 'Ruben Tobia Chaiyadi',
          amount: -7500000,
          date: DateTime(2023, 9, 4, 10, 30),
          message: 'asjdfklajsdfzxnckvlnkasdfn',
          type: 'transfer'),
    ],
  ),
  Contact(
      firstName: 'Justin',
      lastName: 'Salim',
      profilePicture: 'assets/images/profile_pictures/justin.png',
      balance: 87654321.0,
      countryCode: '1',
      phoneNumber: '234567890',
      pin: '987654',
      transactions: [
        Transaction(
            name: 'Top Up',
            amount: 17500175,
            date: DateTime(2023, 9, 3, 10, 15),
            message: 'Added Rp${formatBalance(17500175)}',
            type: 'topup'),
      ]),
  Contact(
      firstName: 'Richard',
      lastName: 'Souwiko',
      profilePicture: 'assets/images/profile_pictures/richard.jpeg',
      balance: 1234567890.0,
      countryCode: '227',
      phoneNumber: '000000',
      pin: '112233',
      transactions: [
        Transaction(
            name: 'Top Up',
            amount: 500000,
            date: DateTime(2023, 9, 3, 10, 15),
            message: 'Added Rp${formatBalance(500000)}',
            type: 'topup'),
        Transaction(
            name: 'Tigo Ilhami Faisyah',
            amount: -350700,
            date: DateTime(2023, 9, 3, 10, 15),
            message: 'test ahhhhhhhhhh',
            type: 'transfer')
      ]),
  Contact(
      firstName: 'Tigo',
      lastName: 'Ilhami Fasyah',
      profilePicture: 'assets/images/profile_pictures/tigo.jpeg',
      balance: 9876543210.0,
      countryCode: '200',
      phoneNumber: '420420',
      pin: '133737',
      transactions: [
        Transaction(
            name: 'Top Up',
            amount: 500000000,
            date: DateTime(2023, 9, 3, 10, 15),
            message: 'Added Rp${formatBalance(500000000)}',
            type: 'topup'),
      ]),
  Contact(
      firstName: 'Ruben',
      lastName: 'Tobia Chaiyadi',
      profilePicture: 'assets/images/profile_pictures/ruben.png',
      balance: 12345678900.0,
      countryCode: '690',
      phoneNumber: '123123',
      pin: '246810',
      transactions: [
        Transaction(
            name: 'Ivander',
            amount: 5000000,
            date: DateTime(2023, 9, 3, 10, 15),
            message: 'test ahhhhhhhhhh',
            type: 'transferred'),
        Transaction(
            name: 'Jason Chainara Putra',
            amount: 5000000,
            date: DateTime(2023, 9, 3, 10, 15),
            message: 'test ahhhhhhhhhh',
            type: 'transferred'),
      ]),
];

Contact findContactByCountryCodeAndPhoneNumber(
    String countryCode, String phoneNumber) {
  Contact foundContact = contacts.firstWhere(
    (contact) =>
        contact.countryCode == countryCode &&
        contact.phoneNumber == phoneNumber,
    orElse: () => Contact(
      firstName: '',
      countryCode: '',
      phoneNumber: '',
      pin: '',
    ),
  );
  return foundContact;
}

Contact findContactByFullName(String fullName) {
  final parts = fullName.split(' ');
  final firstName = parts[0];
  final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : null;

  Contact foundContact = contacts.firstWhere(
    (contact) =>
        contact.firstName == firstName &&
        (lastName == null || contact.lastName == lastName),
    orElse: () => Contact(
      firstName: '',
      countryCode: '',
      phoneNumber: '',
      pin: '',
    ),
  );
  return foundContact;
}
