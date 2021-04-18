class AdversitementModel {
  String? adversitementID;
  String? userID;
  String? adversitementHeader;
  String? advertisementExplanation;
  String? profileUrl;
  int? petID;
  String? cityName;
  String? districtName;
  String? quarterName;
  AdversitementModel({
    this.adversitementID,
    this.userID,
    this.adversitementHeader,
    this.advertisementExplanation,
    this.profileUrl,
    this.petID,
    this.cityName,
    this.districtName,
    this.quarterName,
  });

  String get getLocation => '$cityName/$districtName/$quarterName';
  String get getDistictAndQuarter => '$districtName/$quarterName';

  Map<String, dynamic> toMap() {
    return {
      'adversitementID': adversitementID,
      'userID': userID,
      'adversitementHeader': adversitementHeader,
      'advertisementExplanation': advertisementExplanation,
      'profileUrl': profileUrl,
      'petID': petID,
      'cityName': cityName,
      'districtName': districtName,
      'quarterName': quarterName,
    };
  }

  AdversitementModel.fromMap(Map<String, dynamic> map) {
    adversitementID = map['adversitementID'];
    userID = map['userID'];
    adversitementHeader = map['adversitementHeader'];
    advertisementExplanation = map['advertisementExplanation'];
    profileUrl = map['profileUrl'];
    petID = map['petID'];
    cityName = map['cityName'];
    districtName = map['districtName'];
    quarterName = map['quarterName'];
  }
}
