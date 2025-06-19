import 'package:new_cash_planner/core/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataColumns extends StatelessWidget {
  String title = "";
  String subtitle = "";
  DataColumns({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style:
              cashPlannerTextstyles.normalNormal.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          subtitle,
          style:
              cashPlannerTextstyles.normalNormal.copyWith(color: Colors.white),
        )
      ],
    );
  }
}
