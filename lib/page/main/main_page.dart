import 'package:bd_tour_firebase_admin/controller/main_page_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/save_local.dart';
import '../responsive.dart';

import 'widget/side_menu_widget.dart';

class MainPage extends StatefulWidget {
  final Widget child;

  const MainPage({super.key, required this.child});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    updateData();
    super.initState();
  }

  updateData() async {
    List<dynamic> lists = [];
    var firestore = FirebaseFirestore.instance.collection("categories");
    firestore.doc("category").get().then(
      (value) {
        if (kDebugMode) {
          print(value.data()!["categories"]);
        }
        lists.addAll(value.data()!["categories"]);
        saveDataLocally(lists);

      },
    );
  }


  // final MainPageController controller = Get.find(MainPageController());
  final MainPageController controller = Get.find<MainPageController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawerEnableOpenDragGesture: false,
      // key: controller.scaffoldKey,
      drawer: const SideMenuWidget(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isDesktop(context))
            const Expanded(
              child: SideMenuWidget(),
            ),
          Expanded(
            flex: 5,
            child: widget.child,
          ),
        ],
      ),
    );
  }
}

// class MenuAppController extends ChangeNotifier {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
//
//   void controlMenu() {
//     if (!_scaffoldKey.currentState!.isDrawerOpen) {
//       _scaffoldKey.currentState!.openDrawer();
//     }
//   }
// }
