import 'package:intl/intl.dart';

class AppConstants {
  static AppConstants? _instace;
  static AppConstants get instance {
    _instace ??= AppConstants._init();
    return _instace!;
  }

  AppConstants._init();

  List<String> petList = ['Kedi', 'Köpek', 'Muhabbet Kuşu', 'Papağan', 'Hamster'];

  String convertMiliSecondToDate(String adversitementID) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(adversitementID));
    return DateFormat('dd-MM-yy').format(dateTime);
  }
}
