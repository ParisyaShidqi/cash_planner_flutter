import 'package:new_cash_planner/core/database/delete_cashflow.dart';
import 'package:new_cash_planner/core/database/delete_timely_cashflow.dart';
import 'package:new_cash_planner/core/database/insert_cashflow.dart';
import 'package:new_cash_planner/core/database/insert_timely_cashflow.dart';
import 'package:new_cash_planner/core/database/show_cashflow.dart';
import 'package:new_cash_planner/core/database/show_init_cash_value.dart';
import 'package:new_cash_planner/core/database/show_timely_cashflow.dart';
import 'package:new_cash_planner/core/database/update_init_cash_value.dart';
import 'package:new_cash_planner/core/model/cashflow_model.dart';
import 'package:new_cash_planner/core/model/history_model.dart';
import 'package:new_cash_planner/core/model/init_cash_value_model.dart';
import 'package:new_cash_planner/core/model/timely_cashflow_model.dart';
import 'package:new_cash_planner/core/utils/sprefs.dart';
import 'package:new_cash_planner/screen/homepage/delete_dialog.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeState {
  List<InitCashValueModel> showInit = [];
  RxList<CashflowModel> showCashflow = <CashflowModel>[].obs;
  List<TimelyCashflowModel> showTimelyCashflow = [];
  RxList<HistoryModel> historyModel = <HistoryModel>[].obs;

  RxDouble targetSaving = 0.0.obs;
  RxDouble remainBalanceValue = 0.0.obs;
  RxDouble remainShopBalanceValue = 0.0.obs;

  TextEditingController cashflowEditingController = TextEditingController();
  TextEditingController cashflowReasonEditingController =
      TextEditingController();
  TextEditingController dateTimeEditingController = TextEditingController();
  TextEditingController timelyCashflowEditingController =
      TextEditingController();
  TextEditingController timelyCashflowReasonEditingController =
      TextEditingController();

  String dateTime = "";

  HomeState() {
    homeInit();
  }

  homeInit() async {
    await showInitialData();
    await showCashflowData();
    await showTimelyCashflowData();
    await sortHistoryModel();
    await remainBalance();
    await remainShopBalance();
    await checkFirstMonth();
    await checkTimelyCashflow();
  }

  showInitialData({List<InitCashValueModel>? mockShowInit}) async {
    showInit = await showInitialCashValue();
    targetSaving.value = showInit[0].targetSaving ?? 0;
    print(showInit[0].targetSaving);
    // showInit = mockShowInit ?? [InitCashValueModel(
    //           initialCash: 25000000, targetSaving: 50000, time: "Monthly")];
    // targetSaving?.value = showInit[0].targetSaving ?? 0;

    // return targetSaving?.value ?? 0;
  }

  showCashflowData() async {
    showCashflow.value = await showCashflowValue();
  }

  showTimelyCashflowData() async {
    showTimelyCashflow = await showTimelyCashflowValue();
  }

  remainBalance() {
    remainBalanceValue.value = showInit[0].initialCash ?? 0;

    for (var element in historyModel.value) {
      remainBalanceValue.value =
          remainBalanceValue.value - (element.history ?? 0);
    }

    print("remainBalance ${remainBalanceValue.value}");
  }

  remainShopBalance() {
    remainShopBalanceValue.value = remainBalanceValue.value;

    remainShopBalanceValue.value =
        remainShopBalanceValue.value - (targetSaving?.value ?? 0);
  }

  addCashflow() async {
    await insertCashflow(CashflowModel(
        cashflow: double.parse(cashflowEditingController.text
            .replaceAll("Rp ", "")
            .replaceAll(".", "")),
        dateTime: dateTime,
        reason: cashflowReasonEditingController.text));

    cashflowEditingController.text = "";
    cashflowReasonEditingController.text = "";
    dateTimeEditingController.text = "";

    // historyModel.value.add(HistoryModel(
    //     history: double.parse(cashflowEditingController.text
    //         .replaceAll("Rp ", "")
    //         .replaceAll(".", "")),
    //     dateTime: dateTime,
    //     reason: cashflowReasonEditingController.text));

    await homeInit();
    Get.back();
  }

  addTimelyCashflow() async {
    await insertTimelyCashflow(TimelyCashflowModel(
        timelyCashflow: double.parse(timelyCashflowEditingController.text
            .replaceAll("Rp ", "")
            .replaceAll(".", "")),
        dateTime: dateTime,
        reason: timelyCashflowReasonEditingController.text));

    timelyCashflowEditingController.text = "";
    timelyCashflowReasonEditingController.text = "";
    dateTimeEditingController.text = "";

    // historyModel.value.add(HistoryModel(
    //     history: double.parse(timelyCashflowEditingController.text
    //         .replaceAll("Rp ", "")
    //         .replaceAll(".", "")),
    //     dateTime: dateTime,
    //     reason: timelyCashflowReasonEditingController.text));

    await homeInit();
    Get.back();
  }

  checkTimelyCashflow() async {
    final cron = Cron();

    for (var element in showTimelyCashflow) {
      print("timely : ${element.timelyCashflow}");
      print("timely rason : ${element.reason}");
      print("timely datetime : ${element.dateTime}");
      if (element.dateTime != null) {
        cron.schedule(
            Schedule.parse(
                '0 0 ${DateTime.parse(element.dateTime ?? "0").day} ${DateTime.parse(element.dateTime ?? "0").month} *'),
            () async {
          showInit[0].initialCash =
              (showInit[0].initialCash ?? 0) - (element.timelyCashflow ?? 0);
          await updateInitCashValue(showInit[0]);
          await showInitialData();
        });
      }
    }
  }

  checkFirstMonth() async {
    // bool isFirstMonth =
    //     await sprefsCP.sprefsGetBool(key: "isFirstMonth") ?? false;
    final cron = Cron();

    if (showInit[0].time == "monthly") {
      cron.schedule(Schedule.parse('* * 1 * *'), () async {
        showInit[0].initialCash =
            (showInit[0].initialCash ?? 0) - (showInit[0].initialCash ?? 0);
        await updateInitCashValue(showInit[0]);
        await showInitialData();
      });
    } else {
      cron.schedule(Schedule.parse('* * 1 1 *'), () async {
        showInit[0].initialCash =
            (showInit[0].initialCash ?? 0) - (showInit[0].initialCash ?? 0);
        await updateInitCashValue(showInit[0]);
        await showInitialData();
      });
    }

    // if (DateTime.now().day == 1) {
    //   await sprefsCP.sprefsSetBool(key: "isFirstMonth", value: true);
    //   isFirstMonth = true;
    // }
    // if (isFirstMonth) {
    //   showInit[0].initialCash =
    //       (showInit[0].initialCash ?? 0) + (showInit[0].initialCash ?? 0);
    //   await updateInitCashValue(showInit[0]);
    //   await showInitialData();
    // }
  }

  sortHistoryModel() async {
    historyModel.value.clear();
    for (var element in showCashflow.value) {
      if (DateTime.parse(element.dateTime ?? "0").isBefore(DateTime.now())) {
        historyModel.value.add(HistoryModel(
            history: element.cashflow,
            dateTime: element.dateTime,
            id: element.id,
            reason: element.reason,
            type: "Baru"));

        print("baru: ${element.reason}");
      }
    }

    for (var element in showTimelyCashflow) {
      if (DateTime.parse(element.dateTime ?? "0").isBefore(DateTime.now())) {
        print("datetime: ${element.dateTime}");
        historyModel.value.add(HistoryModel(
            history: element.timelyCashflow,
            dateTime: element.dateTime,
            id: element.id,
            reason: element.reason,
            type: "Bulanan"));
      }
    }

    historyModel.value = historyModel.value;

    if (historyModel.value.length > 1) {
      historyModel.value.sort(
        (a, b) => a.dateTime!.compareTo(b.dateTime ?? ""),
      );
    }
    print("history length after: ${historyModel.value.length}");
  }

  dismissEntry(BuildContext context, int index) async {
    if (historyModel.value[index].type == "Baru") {
      await deleteCashflow(historyModel.value[index].id!);
    } else {
      await deleteTimelyCashflow(historyModel.value[index].id!);
    }
    historyModel.removeAt(index);
    await showInitialData();
  }
}
