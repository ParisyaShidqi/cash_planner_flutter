import 'package:new_cash_planner/core/utils/textstyles.dart';
import 'package:new_cash_planner/screen/homepage/cashflow_button.dart';
import 'package:new_cash_planner/screen/homepage/cashflow_form.dart';
import 'package:new_cash_planner/screen/homepage/cashflow_input.dart';
import 'package:new_cash_planner/screen/homepage/home_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CashflowDialog extends StatelessWidget {
  const CashflowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeState homestate = Get.find();

    return AlertDialog(
      contentPadding: const EdgeInsets.all(15),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CashflowButton(
              title: "Pengeluaran baru",
              onTap: () {
                Get.back();
                Get.dialog(CashflowForm(
                  titleEditingController: homestate.cashflowEditingController,
                  subtitleEditingController:
                      homestate.cashflowReasonEditingController,
                  dateTimeEditingController:
                      homestate.dateTimeEditingController,
                  cashForm: "new",
                ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CashflowButton(
              title: "Pengeluaran bulanan",
              onTap: () {
                Get.back();
                Get.dialog(CashflowForm(
                  titleEditingController:
                      homestate.timelyCashflowEditingController,
                  subtitleEditingController:
                      homestate.timelyCashflowReasonEditingController,
                  dateTimeEditingController:
                      homestate.dateTimeEditingController,
                  cashForm: "monthly",
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
