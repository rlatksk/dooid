class profile {
  String? first_name;
  String? last_name;
  String? profile_picture;
  String? balance;
  String? email;
  String? phone_number;
  String? pin;

  profile({
    this.first_name,
    this.last_name,
    this.profile_picture,
    this.balance,
    this.email,
    this.phone_number,
    this.pin,
  });
}

profile kevinProfile = profile(
  first_name: 'Kevin',
  last_name: 'Leonardo',
  profile_picture: 'assets/images/home/nair_guy.jpeg',
  balance: '24,365,322.46',
  email: 'kevin@example.com',
  phone_number: '1234567890',
  pin: '1234',
);
