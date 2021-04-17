import 'package:sahiplen/core/base/modelview/base_view_model.dart';

class LandingViewModel extends BaseViewModel {
  @override
  void init() {}

  LandingViewModel() {
    currentUser();
  }

  Future<void> currentUser() async {
    try {
      isLoadingSet = true;
      await appRepository.currentUser();
    } finally {
      isLoadingSet = false;
    }
  }
}
