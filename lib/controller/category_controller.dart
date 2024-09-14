
import 'package:get/get.dart';

import '../const/const.dart';
import '../res/string_constant.dart';

class CategoryController extends GetxController {

  List<String> categories = sharedPreference!.getStringList(StringConstant.categoriesSharePre)!;
  var selectedCategory = sharedPreference!.getStringList(StringConstant.categoriesSharePre)![0].obs;

  List<String> allCategories = sharedPreference!.getStringList(StringConstant.allCategoriesSharePre)!;
  var allSelectedCategory = sharedPreference!.getStringList(StringConstant.allCategoriesSharePre)![0].obs;

  void setCategory({required String category}) {
    selectedCategory.value = category;
  }
  void setAllCategory({required String category}) {
    allSelectedCategory.value = category;
  }
}
