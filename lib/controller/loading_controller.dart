import 'package:get/get.dart';

import '../const/const.dart';
import '../res/routes/routers.dart';



class LoadingController extends GetxController {
  var isLoading = false.obs;

  setLoading({required bool isLoading}) {
    this.isLoading.value = isLoading;
  }

  var selectIndex = SidebarItem.dashboardScreen.value.obs;

  setIndex ({required String index}){
    selectIndex.value = index;
  }

}
