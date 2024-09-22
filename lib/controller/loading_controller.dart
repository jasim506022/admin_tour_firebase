import 'package:get/get.dart';

class LoadingController extends GetxController {
  var isLoading = false.obs;

  setLoading({required bool isLoading}) {
    this.isLoading.value = isLoading;
  }
}
