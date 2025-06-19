import 'package:new_cash_planner/core/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CashflowButton extends StatelessWidget {
  String title = "";
  VoidCallback onTap;
  CashflowButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: HexColor("#027AFA"),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: cashPlannerTextstyles.smallBold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
