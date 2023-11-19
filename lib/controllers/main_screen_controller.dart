import 'package:get/get.dart';

class MainScreenController extends GetxController {

RxInt selectedIndex = 0.obs;

   void onItemTapped(int index) {
      selectedIndex.value = index;
  }
}