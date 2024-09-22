import '../res/constant.dart';
import '../res/string_constant.dart';

class SaveDataLocalStorage {
  static Future<void> saveCategories(List<dynamic> dataList) async {
    List<String> categoryList = dataList.map((e) => e.toString()).toList();
    List<String> allCategoryList = ["All", ...categoryList];

    await ConstantData.sharedPreference!
        .setStringList(StringConstant.categoriesSharePre, categoryList);
    await ConstantData.sharedPreference!
        .setStringList(StringConstant.allCategoriesSharePre, allCategoryList);
  }

  static Future<void> saveCurrentRouthPath(String currentPath) async {
    await ConstantData.sharedPreference!
        .setString(StringConstant.currentPathSharePre, currentPath);
  }
}

// Storage
