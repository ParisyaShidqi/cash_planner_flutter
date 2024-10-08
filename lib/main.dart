import 'package:cash_planner_flutter/core/database/database_handler.dart';
import 'package:cash_planner_flutter/core/database/insert_init_cash_value.dart';
import 'package:cash_planner_flutter/core/database/show_init_cash_value.dart';
import 'package:cash_planner_flutter/core/model/init_cash_value_model.dart';
import 'package:cash_planner_flutter/screen/loading-screen/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

dbRun() async {
  await insertInitCashValue(InitCashValueModel(
      initialCash: 1000000, targetSaving: 100000, time: "Monthly"));
  List<InitCashValueModel> showInit = await showInitialCashValue();
  for (var element in showInit) {
    print(element.initialCash);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
 //   dbRun();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        locale: Get.deviceLocale,
        fallbackLocale: const Locale("id", "ID"),
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoadingScreen());
  }
}
