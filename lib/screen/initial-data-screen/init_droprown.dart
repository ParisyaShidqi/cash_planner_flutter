import 'package:new_cash_planner/screen/homepage/homepage.dart';
import 'package:new_cash_planner/screen/initial-data-screen/initial_data_state.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class InitDropdown extends StatelessWidget {
  String title = "";

  InitDropdown({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final InitialDataState initialDataState = Get.find();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60),
      child: Card(
        color: HexColor("#008BF4"),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                    child: DropdownButtonFormField<String>(
                      value: initialDataState.selectedTime,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: HexColor("#33A1F5"),
                      ),
                      elevation: 16,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15))),
                      isDense: true,
                      onChanged: (String? value) {
                        initialDataState.changeDropdownValue(value!);
                      },
                      items: initialDataState.timeList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.poppins()
                                .copyWith(color: HexColor("#33A1F5")),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      // initialDataState.pageController.nextPage(
                      //     duration: const Duration(milliseconds: 500),
                      //     curve: Curves.easeIn);
                      // await initialDataState.haltAnim();
                      initialDataState.submitInitData();
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
