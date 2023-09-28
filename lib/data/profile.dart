class Contact {
  String? firstName;
  String? lastName;
  String? profilePicture;
  double? balance;
  String? email;
  String? countryCode;
  String? phoneNumber;
  String? pin;

  Contact({
    this.firstName,
    this.lastName,
    this.profilePicture,
    this.balance,
    this.email,
    this.countryCode,
    this.phoneNumber,
    this.pin,
  });

  String get name {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    } else if (firstName != null) {
      return firstName!;
    } else if (lastName != null) {
      return lastName!;
    } else {
      return '';
    }
  }

  String get completePhoneNumber {
    if (countryCode != null && phoneNumber != null) {
      return '+$countryCode $phoneNumber';
    } else if (phoneNumber != null) {
      return phoneNumber!;
    } else {
      return '';
    }
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
    profilePicture: null,
    balance: 123456789.0,
    email: 'jason@example.com',
    countryCode: '62',
    phoneNumber: '628555123456',
    pin: '123456',
  ),
  Contact(
    firstName: 'Ivander',
    profilePicture: null,
    balance: 987654321.0,
    email: 'ivander@example.com',
    countryCode: '81',
    phoneNumber: '819876543210',
    pin: '654321',
  ),
  Contact(
    firstName: 'Justin',
    lastName: 'Salim',
    profilePicture: null,
    balance: 87654321.0,
    email: 'justin@example.com',
    countryCode: '1',
    phoneNumber: '1234567890',
    pin: '987654',
  ),
  Contact(
    firstName: 'Richard',
    lastName: 'Souwiko',
    profilePicture: null,
    balance: 1234567890.0,
    email: 'richard@example.com',
    countryCode: '227',
    phoneNumber: '227000000',
    pin: '112233',
  ),
  Contact(
    firstName: 'Tigo',
    lastName: 'Ilhami Fasyah',
    profilePicture: null,
    balance: 9876543210.0,
    email: 'tigo@example.com',
    countryCode: '420',
    phoneNumber: '420420420',
    pin: '1337',
  ),
  Contact(
    firstName: 'Ruben',
    lastName: 'Tobia Chaiyadi',
    profilePicture: null,
    balance: 12345678900.0,
    email: 'ruben@example.com',
    countryCode: '123',
    phoneNumber: '123123123',
    pin: '246810',
  ),
];

Contact kevinProfile = Contact(
  firstName: 'Kevin',
  lastName: 'Leonardo',
  profilePicture: 'assets/images/home/nair_guy.jpeg',
  balance: 2436532246,
  email: 'kevin@example.com',
  countryCode: '62',
  phoneNumber: '081377758897',
  pin: '132546',
);
