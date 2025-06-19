import 'package:new_cash_planner/core/utils/textstyles.dart';
import 'package:new_cash_planner/screen/homepage/homepage.dart';
import 'package:new_cash_planner/screen/initial-data-screen/initial_data_state.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class InitTextfield extends StatelessWidget {
  String title = "";
  TextEditingController textEditingController = TextEditingController();
  InitTextfield(
      {super.key, required this.title, required this.textEditingController});
  RxBool validate = true.obs;

  @override
  Widget build(BuildContext context) {
    final InitialDataState initialDataState = Get.find();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60),
      child: Card(
        color: HexColor("#008BF4"),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins().copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => TextFormField(
                        cursorColor: HexColor("#33A1F5"),
                        style: GoogleFonts.poppins()
                            .copyWith(color: HexColor("#33A1F5")),
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          CurrencyTextInputFormatter.currency(
                              locale: "id", decimalDigits: 0, name: "Rp ")
                        ],
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            isDense: true,
                            errorText: validate.value
                                ? null
                                : "Entry masih kosong, mohon diisi terlebih dahulu...",
                            errorStyle: cashPlannerTextstyles.smallBold
                                .copyWith(color: Colors.white),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      validate.value = initialDataState.validateTextfield(
                          validate.value, textEditingController);
                      if (textEditingController.text.isNotEmpty) {
                        FocusScope.of(context).unfocus();
                        initialDataState.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                        await initialDataState.haltAnim();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: HexColor("#33A1F5")),
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.arrow_forward,
                        color: HexColor("#33A1F5"),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
