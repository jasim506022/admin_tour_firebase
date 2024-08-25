

import 'package:flutter/material.dart';
import 'package:get/get.dart';

 enum MainPageState{dashboard, addTour, editTour, tours, example, image}

class MainPageController extends GetxController{

   var currentState = MainPageState.dashboard.obs;

   void onChangeState({required MainPageState currentState}){
     this.currentState.value = currentState;
   }

   final scaffoldKey = GlobalKey<ScaffoldState>();
   // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

   void controlMenu() {
     if (scaffoldKey.currentState != null && !scaffoldKey.currentState!.isDrawerOpen) {
       scaffoldKey.currentState!.openDrawer();
     }
   }

}