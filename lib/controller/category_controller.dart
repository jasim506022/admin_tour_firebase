
import 'package:get/get.dart';


import '../res/constant.dart';
import '../res/string_constant.dart';

class CategoryController extends GetxController {

  List<String> categories =ConstantData. sharedPreference!.getStringList(StringConstant.categoriesSharePre)!;
  var selectedCategory = ConstantData.sharedPreference!.getStringList(StringConstant.categoriesSharePre)![0].obs;

  List<String> allCategories = ConstantData.sharedPreference!.getStringList(StringConstant.allCategoriesSharePre)!;
  var allSelectedCategory = ConstantData.sharedPreference!.getStringList(StringConstant.allCategoriesSharePre)![0].obs;

  void setCategory({required String category}) {
    selectedCategory.value = category;
  }
  void setAllCategory({required String category}) {
    allSelectedCategory.value = category;
  }
}
