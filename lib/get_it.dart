import 'package:sahiplen/common/services/firebase_stroge_service.dart';

import 'common/repository/app_repository.dart';

import 'package:get_it/get_it.dart';

import 'common/services/firebase_auth_service.dart';
import 'common/services/firebase_firestore_service.dart';

GetIt getIt = GetIt.asNewInstance();

void getItSetup() async {
  getIt.registerLazySingleton(() => AppRepository());
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton(() => FirebaseFirestoreService());
  getIt.registerLazySingleton(() => FirebaseStrogeService());
}
