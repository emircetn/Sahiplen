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

  String get nameAndSurnameFirstCharacter => (displayName!.split('').first[0] + displayName!.split('').last[0]).toUpperCase();

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

  AppUser clone() => copyWith(
        userID: userID,
        email: email,
        displayName: displayName,
        profileUrl: profileUrl,
      );

  AppUser copyWith({
    String? userID,
    String? email,
    String? displayName,
    String? profileUrl,
  }) {
    return AppUser(
      userID: userID ?? this.userID,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }

  bool isEqual(AppUser? other) {
    if (identical(this, other)) return true;
    return other is AppUser && other.userID == userID && other.email == email && other.displayName == displayName && other.profileUrl == profileUrl;
  }
}
