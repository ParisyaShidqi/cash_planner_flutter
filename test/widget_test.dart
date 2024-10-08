// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cash_planner_flutter/core/database/show_init_cash_value.dart';
import 'package:cash_planner_flutter/core/model/init_cash_value_model.dart';
import 'package:cash_planner_flutter/screen/homepage/home_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('calculateTotalFromDatabase returns correct sum', ()async {
    HomeState homeState = HomeState();
    expect(
       await homeState.showInitialData(mockShowInit: [
          InitCashValueModel(
              initialCash: 25000000, targetSaving: 5000000, time: "Monthly")
        ]),
        5000000);
  });
}
