import 'package:new_cash_planner/core/database/insert_init_cash_value.dart';
import 'package:new_cash_planner/core/model/init_cash_value_model.dart';
import 'package:new_cash_planner/core/utils/sprefs.dart';
import 'package:new_cash_planner/screen/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialDataState extends GetxController {
  int currentIndex = 0;
  Key animGetStart = Key("animStart");
  bool isDoneAnimating = false;
  bool isSubmit = false;
  String selectedTime = "Monthly";
  List<String> timeList = ["Monthly", "Yearly"];
  final PageController pageController = PageController();
  TextEditingController initCashController = TextEditingController();
  TextEditingController targetSavingController = TextEditingController();

  haltAnim() async {
    if (currentIndex == 2) {
      await Future.delayed(Duration(milliseconds: 500)).then((value) {
        isDoneAnimating = true;
      });
    } else {
      isDoneAnimating = false;
    }
  }

  changeDropdownValue(String value) {
    selectedTime = value;
  }

  submitInitData() async {
    print("targetSavingController.text: ${targetSavingController.text}");
    await insertInitCashValue(InitCashValueModel(
            initialCash: double.parse(initCashController.text
                .replaceAll("Rp ", "")
                .replaceAll(".", "")),
            targetSaving: double.parse(targetSavingController.text
                .replaceAll("Rp ", "")
                .replaceAll(".", "")),
            time: selectedTime))
        .then((value) async {
      print("hi yaaa");
      await sprefsCP.sprefsSetBool(key: "isInitCash", value: true);
      Get.to(() => const HomePage());
    });
  }

  validateTextfield(
      bool validate, TextEditingController textEditingController) {
    validate = textEditingController.text.isNotEmpty;

    return validate;
  }
}
