import 'package:new_cash_planner/core/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  String title = "";
  String subtitle = "";
  String trailing = "";
  String type = "";
  HistoryCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.trailing,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: HexColor("#60B9FC"), width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              NumberFormat.simpleCurrency(
                      decimalDigits: 0, locale: "id", name: "Rp ")
                  .format(int.parse(title)),
              style: cashPlannerTextstyles.smallBold
                  .copyWith(color: HexColor("#027AFA")),
            ),
            Text(
              type,
              style: cashPlannerTextstyles.smallNormal
                  .copyWith(color: HexColor("#60B9FC")),
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              subtitle,
              style: cashPlannerTextstyles.smallNormal
                  .copyWith(color: HexColor("#60B9FC")),
            ),
            Text(
              DateFormat("dd/MMM/yyyy").format(DateTime.parse(
                  trailing.isEmpty ? DateTime.now().toString() : trailing)),
              style: cashPlannerTextstyles.smallBold
                  .copyWith(color: HexColor("#027AFA")),
            ),
          ],
        ),
      ),
    );
  }
}
