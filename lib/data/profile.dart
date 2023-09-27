class Profile {
  String? first_name;
  String? last_name;
  String? profile_picture;
  double? balance;
  String? email;
  String? country_code;
  String? phone_number;
  String? pin;

  Profile({
    this.first_name,
    this.last_name,
    this.profile_picture,
    this.balance,
    this.email,
    this.country_code,
    this.phone_number,
    this.pin,
  });
}

Profile kevinProfile = Profile(
  first_name: 'Kevin',
  last_name: 'Leonardo',
  profile_picture: 'assets/images/home/nair_guy.jpeg',
  balance: 2436532246,
  email: 'kevin@example.com',
  country_code: '62',
  phone_number: '081377758897',
  pin: '132546',
);
