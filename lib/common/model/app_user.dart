class AppUser {
  String? userID;
  String? email;
  String? displayName;
  String? city;
  String? profileUrl;

  AppUser({
    this.userID,
    this.email,
    this.displayName,
    this.city,
    this.profileUrl,
  });

  String get nameAndSurnameFirstCharacter => (displayName!.split('').first[0] + displayName!.split('').last[0]).toUpperCase();

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'displayName': displayName,
      'city': city,
      'profileUrl': profileUrl,
    };
  }

  AppUser.fromMap(Map<String, dynamic> map) {
    userID = map['userID'];
    email = map['email'];
    displayName = map['displayName'];
    city = map['city'];
    profileUrl = map['profileUrl'];
  }
}

extension AppUserExtension on String {
  String get nameAndSurnameFirstCharacter => '£{}';
}
