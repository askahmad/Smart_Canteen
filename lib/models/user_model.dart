class UserModel {
  final String uid;
  final String fullName;
  final String phoneNumber;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String email;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    this.email = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'address': address,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'country': country,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      uid: uid,
      fullName: map['fullName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      zipCode: map['zipCode'] ?? '',
      country: map['country'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
