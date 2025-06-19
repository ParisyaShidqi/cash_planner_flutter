import 'package:new_cash_planner/core/utils/textstyles.dart';
import 'package:new_cash_planner/screen/homepage/cashflow_dialog.dart';
import 'package:new_cash_planner/screen/homepage/data_columns.dart';
import 'package:new_cash_planner/screen/homepage/delete_dialog.dart';
import 'package:new_cash_planner/screen/homepage/history_card.dart';
import 'package:new_cash_planner/screen/homepage/home_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeState homeState = Get.put(HomeState());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(width: 5, color: HexColor("#60B9FC")),
                  color: HexColor("#027AFA"),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Expanded(
                        child: DataColumns(
                          title: "Target savingmu",
                          subtitle: NumberFormat.simpleCurrency(
                                  name: "Rp ", decimalDigits: 0, locale: "id")
                              .format(double.parse(
                                  (homeState.targetSaving?.value ?? 0)
                                      .toString())),
                        ),
                      )),
                  Obx(() => Expanded(
                        child: DataColumns(
                          title: "saldo pengeluaran",
                          subtitle: NumberFormat.simpleCurrency(
                                  name: "Rp ", decimalDigits: 0, locale: "id")
                              .format(homeState.remainShopBalanceValue.value
                                  .toInt()),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Column(
              children: [
                Text(
                  "Savingmu bulan ini",
                  style: cashPlannerTextstyles.largeNormal
                      .copyWith(color: HexColor("#60B9FC")),
                ),
                const SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Text(
                      NumberFormat.simpleCurrency(
                              name: "Rp ", decimalDigits: 0, locale: "id")
                          .format(homeState.remainBalanceValue.value.toInt()),
                      style: cashPlannerTextstyles.extraLargeBold
                          .copyWith(color: HexColor("#027AFA"))),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Histori pengeluaran",
                    style: cashPlannerTextstyles.largeNormal
                        .copyWith(color: HexColor("#027AFA")),
                  ),
                  InkWell(
                    onTap: () async {
                      await showDialog(
                          context: context,
                          builder: (context) => const CashflowDialog());
                    },
                    child: Icon(
                      Icons.add,
                      color: HexColor("#027AFA"),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Obx(() => ListView.builder(
                    itemCount: homeState.historyModel.value.length,
                    itemBuilder: (context, index) => Dismissible(
                          key: ValueKey(homeState.historyModel.value[index]),
                          confirmDismiss: (direction) async => await showDialog(
                              context: context,
                              builder: (context) => DeleteDialog()),
                          onDismissed: (direction) {
                            homeState.dismissEntry(context, index);
                          },
                          child: HistoryCard(
                            title: (homeState.historyModel.value[index].history
                                        ?.toInt() ??
                                    0)
                                .toString(),
                            subtitle:
                                homeState.historyModel.value[index].reason ??
                                    "",
                            trailing:
                                homeState.historyModel.value[index].dateTime ??
                                    "",
                            type:
                                homeState.historyModel.value[index].type ?? "",
                          ),
                        ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
