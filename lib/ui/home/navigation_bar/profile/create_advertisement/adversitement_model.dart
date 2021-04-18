class AdversitementModel {
  String? adversitementHeader;
  String? advertisementExplanation;
  String? cityName;
  String? districtName;
  String? quarterName;
  AdversitementModel({
    this.adversitementHeader,
    this.advertisementExplanation,
    this.cityName,
    this.districtName,
    this.quarterName,
  });

  String get getLocation => '$cityName/$districtName/$quarterName';
  String get getDistictAndQuarter => '$districtName/$quarterName';
}
