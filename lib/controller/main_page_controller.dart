

import 'package:get/get.dart';

 enum MainPageState{dashboard, addTour, editTour, tours, example, image}

class MainPageController extends GetxController{

   var currentState = MainPageState.dashboard.obs;

   void onChangeState({required MainPageState currentState}){
     this.currentState.value = currentState;
   }


}