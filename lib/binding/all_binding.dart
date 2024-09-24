import 'package:bd_tour_firebase_admin/controller/add_tour_controller.dart';
import 'package:bd_tour_firebase_admin/controller/category_controller.dart';
import 'package:bd_tour_firebase_admin/controller/guide_controller.dart';
import 'package:bd_tour_firebase_admin/controller/login_controller.dart';
import 'package:bd_tour_firebase_admin/controller/main_page_controller.dart';
import 'package:bd_tour_firebase_admin/controller/profile_controller.dart';
import 'package:bd_tour_firebase_admin/controller/tour_controller.dart';
import 'package:bd_tour_firebase_admin/controller/user_controller.dart';
import 'package:bd_tour_firebase_admin/repository/add_tour_repository.dart';
import 'package:bd_tour_firebase_admin/repository/guide_repository.dart';
import 'package:bd_tour_firebase_admin/repository/main_repository.dart';
import 'package:bd_tour_firebase_admin/repository/profile_repository.dart';
import 'package:bd_tour_firebase_admin/repository/tour_repository.dart';
import 'package:bd_tour_firebase_admin/repository/user_repository.dart';
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

    Get.lazyPut<UserRepository>(
      () => UserRepository(),
    );

    Get.lazyPut<GuideRepository>(
      () => GuideRepository(),
    );

    Get.lazyPut<AddTourRepository>(
      () => AddTourRepository(),
    );

    Get.lazyPut<ProfileRepository>(
      () => ProfileRepository(),
    );

    Get.lazyPut<TourRepository>(
      () => TourRepository(),
    );

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
        fenix: true);

    Get.lazyPut<AddTourController>(
        () => AddTourController(Get.find<AddTourRepository>()),
        fenix: true);

    Get.lazyPut<CategoryController>(() => CategoryController(), fenix: true);


    Get.lazyPut<UserController>(
        () => UserController(Get.find<UserRepository>()),
        fenix: true);

    Get.lazyPut<GuideController>(
        () => GuideController(Get.find<GuideRepository>()),
        fenix: true);

    Get.lazyPut<ProfileController>(
      () => ProfileController(Get.find<ProfileRepository>()),
    );
  }
}
