import 'package:carousel_slider/carousel_slider.dart';
import 'package:cash_planner_flutter/screen/homepage/homepage.dart';
import 'package:cash_planner_flutter/screen/initial-data-screen/init_droprown.dart';
import 'package:cash_planner_flutter/screen/initial-data-screen/init_textfield.dart';
import 'package:cash_planner_flutter/screen/initial-data-screen/initial_data_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialDataScreen extends StatelessWidget {
  InitialDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final InitialDataState initDataState = Get.put(InitialDataState());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/bubble-bg.png",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              SizedBox(
                height: 150,
                child: PageView(
                  controller: initDataState.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    InitTextfield(
                      title: "Saldo awalmu",
                      textEditingController: initDataState.initCashController,
                    ),
                    InitTextfield(
                      title: "Target saving",
                      textEditingController:
                          initDataState.targetSavingController,
                    ),
                    InitDropdown(
                      title: "Waktu saving",
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
