import 'package:new_cash_planner/core/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Hapus Entry ?",
        style: cashPlannerTextstyles.smallBold,
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Get.back(result: true);
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: HexColor("#027AFA")),
            child: Text(
              "Ya",
              style: cashPlannerTextstyles.smallNormal
                  .copyWith(color: Colors.white),
            )),
        ElevatedButton(
            onPressed: () {
              Get.back(result: false);
            },
            style:
                ElevatedButton.styleFrom(backgroundColor: HexColor("#027AFA")),
            child: Text(
              "Tidak",
              style: cashPlannerTextstyles.smallNormal
                  .copyWith(color: Colors.white),
            ))
      ],
    );
  }
}
