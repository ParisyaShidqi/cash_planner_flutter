import 'package:new_cash_planner/core/database/database_handler.dart';
import 'package:new_cash_planner/core/database/insert_init_cash_value.dart';
import 'package:new_cash_planner/core/database/show_init_cash_value.dart';
import 'package:new_cash_planner/core/model/init_cash_value_model.dart';
import 'package:new_cash_planner/core/utils/firebase_cloud_msg.dart';
import 'package:new_cash_planner/screen/loading-screen/loading_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.notification?.body ?? ""}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseCloudMsg().fcmPermission();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseCloudMsg().foregroundMessaging();

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
