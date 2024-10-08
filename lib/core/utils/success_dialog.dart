import 'package:cash_planner_flutter/core/utils/textstyles.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        "Sukses menambahkan entry",
        style: cashPlannerTextstyles.normalNormal,
      ),
    );
  }
}
