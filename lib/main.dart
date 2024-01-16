import 'package:expense_tracking_app/models/balance/balance_model.dart';
import 'package:expense_tracking_app/models/income_model.dart';
import 'package:expense_tracking_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'firebase_options.dart';

late Size mq;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(incomeModelAdapter());
  Hive.registerAdapter(BalanceModelAdapter());
  await Hive.openBox<IncomeModel>('income');
  await Hive.openBox<BalanceModel>('balance');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PocketTracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7F3DFF)),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
