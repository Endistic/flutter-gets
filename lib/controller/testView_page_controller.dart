import 'package:get/get.dart';

class TestViewPageController extends GetxController {
  // create Observable Variables in controller Class

  // GetX makes use of Reactive programming which is as easy as using setState.
  // Making Observable Variables by .obs

  RxBool isVisible = true.obs;

  void showContainer() {
    isVisible.value = true;
  }

  void hideContainer() {
    isVisible.value = false;
  }

  void toggleContainer() {
    isVisible.value = !isVisible.value;
  }
}
