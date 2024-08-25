import 'package:bd_tour_firebase_admin/const/const.dart';


Future<void> saveDataLocally(List<dynamic> dataList) async {
  List<String> categoryList = dataList.map((e) => e.toString()).toList();
  print(categoryList.length);
  await sharedPreference!.setStringList('dataList', categoryList);
}
