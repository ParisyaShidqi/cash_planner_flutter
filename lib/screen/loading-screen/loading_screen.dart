import 'package:new_cash_planner/screen/loading-screen/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoadingState loadingState = Get.put(LoadingState());
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/bubble-logo.png",
                scale: 2,
              ),
            ),
          )
        ],
      ),
    );
  }
}
