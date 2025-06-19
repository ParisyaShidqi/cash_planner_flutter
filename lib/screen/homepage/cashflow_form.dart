import 'package:new_cash_planner/core/utils/success_dialog.dart';
import 'package:new_cash_planner/core/utils/textstyles.dart';
import 'package:new_cash_planner/screen/homepage/cashflow_button.dart';
import 'package:new_cash_planner/screen/homepage/cashflow_input.dart';
import 'package:new_cash_planner/screen/homepage/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CashflowForm extends StatelessWidget {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController subtitleEditingController = TextEditingController();
  TextEditingController dateTimeEditingController = TextEditingController();
  String cashForm = "";
  CashflowForm(
      {super.key,
      required this.titleEditingController,
      required this.subtitleEditingController,
      required this.dateTimeEditingController,
      required this.cashForm});

  @override
  Widget build(BuildContext context) {
    final HomeState homeState = Get.find();
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CashflowInput(
            title: "Jumlah pengeluaran",
            textEditingController: titleEditingController,
            isCurrency: true,
          ),
          const SizedBox(
            height: 15,
          ),
          CashflowInput(
            title: "Alasan pengeluaran",
            textEditingController: subtitleEditingController,
          ),
          const SizedBox(
            height: 15,
          ),
          CashflowInput(
            title: "Tanggal pengeluaran",
            textEditingController: dateTimeEditingController,
            isDate: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                  child: CashflowButton(
                title: "lanjut",
                onTap: () async {
                  if (cashForm == "monthly") {
                    await homeState.addTimelyCashflow();
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => const SuccessDialog(),
                      );
                    }
                  } else {
                    await homeState.addCashflow();
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (context) => const SuccessDialog(),
                      );
                    }
                  }
                },
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: CashflowButton(
                title: "Batal",
                onTap: () {
                  Get.back();
                },
              ))
            ],
          )
        ],
      ),
    );
  }
}
