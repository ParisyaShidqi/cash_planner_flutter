import 'package:new_cash_planner/core/utils/textstyles.dart';
import 'package:new_cash_planner/screen/homepage/home_state.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class CashflowInput extends StatelessWidget {
  String title = "";
  bool? isDate = false;
  bool? isCurrency = false;
  TextEditingController textEditingController = TextEditingController();
  CashflowInput(
      {super.key,
      required this.title,
      required this.textEditingController,
      this.isDate,
      this.isCurrency});

  @override
  Widget build(BuildContext context) {
    HomeState homeState = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: cashPlannerTextstyles.smallBold
              .copyWith(color: HexColor("#027AFA")),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          onTap: isDate == true
              ? () {
                  showDatePicker(
                          context: context,
                          firstDate: DateTime(1990, 1),
                          lastDate: DateTime.now())
                      .then((value) {
                    textEditingController.text =
                        DateFormat("dd/MMM/yyyy").format(value ?? DateTime(0));
                    homeState.dateTime = value.toString();
                  });
                }
              : () {},
          keyboardType: isCurrency == true ? TextInputType.number : null,
          cursorColor: HexColor("#027AFA"),
          inputFormatters: isCurrency == true
              ? [
                  CurrencyTextInputFormatter.currency(
                      locale: "id", decimalDigits: 0, name: "Rp ")
                ]
              : null,
          style: cashPlannerTextstyles.smallBold
              .copyWith(color: HexColor("#027AFA")),
          controller: textEditingController,
          decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: HexColor("#027AFA"))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: HexColor("#027AFA"))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: HexColor("#027AFA")))),
        )
      ],
    );
  }
}
