import 'package:cash_planner_flutter/core/utils/sprefs.dart';
import 'package:cash_planner_flutter/screen/homepage/homepage.dart';
import 'package:cash_planner_flutter/screen/initial-data-screen/initial_data_screen.dart';
import 'package:get/get.dart';

class LoadingState extends GetxController {
  LoadingState() {
    gotoInitOrHomepage();
  }
}

gotoInitOrHomepage() async {
  Future.delayed(
    const Duration(milliseconds: 2000),
    () async {
      bool isInitCash =
          await sprefsCP.sprefsGetBool(key: "isInitCash") ?? false;

      print("isinitcash: ${isInitCash}");
      
      if (isInitCash) {
        Get.to(() => const HomePage());
      } else {
        Get.to(() => InitialDataScreen());
      }
    },
  );
}
