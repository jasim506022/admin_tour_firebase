
import 'package:bd_tour_firebase_admin/controller/category_controller.dart';
import 'package:bd_tour_firebase_admin/controller/login_controller.dart';
import 'package:bd_tour_firebase_admin/controller/main_page_controller.dart';
import 'package:bd_tour_firebase_admin/controller/tour_controller.dart';
import 'package:bd_tour_firebase_admin/repository/main_repository.dart';
import 'package:bd_tour_firebase_admin/repository/tour_repository.dart';
import 'package:get/get.dart';

import '../repository/login_repository.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    // Loading Login Repository
    Get.lazyPut<LoginRepository>(
      () => LoginRepository(),
    );

    Get.lazyPut<MainRepository>(
      () => MainRepository(),
    );

    Get.lazyPut<TourRepository>(() => TourRepository(),);

    //Lazy Load the Controller  and inject Repository
    Get.lazyPut<MainPageController>(
      () => MainPageController(mainRepository: Get.find<MainRepository>()),
    );

    Get.lazyPut<LoginController>(
          () => LoginController(loginRepository: Get.find<LoginRepository>()),
    );
    Get.lazyPut<CategoryController>(
          () => CategoryController(),
    );
    // Get.put(TourController(repository: Get.find<TourRepository>()));
    Get.lazyPut<TourController>(
          () => TourController(repository: Get.find<TourRepository>()),
      fenix: true
    );

    Get.lazyPut<CategoryController>(
            () => CategoryController(),
        fenix: true
    );


  }
}
