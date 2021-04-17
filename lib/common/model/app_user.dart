class AppUser {
  String? userID;
  String? email;
  String? displayName;
  String? profileUrl;

  AppUser({
    this.userID,
    this.email,
    this.displayName,
    this.profileUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'displayName': displayName,
      'profileUrl': profileUrl,
    };
  }

  AppUser.fromMap(Map<String, dynamic> map) {
    userID = map['userID'];
    email = map['email'];
    displayName = map['displayName'];
    profileUrl = map['profileUrl'];
  }
}
