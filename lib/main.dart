import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizing_web/app/view/recorde_expense/recorde_expense_bindings.dart';
import 'package:organizing_web/app/view/recorde_expense/recorde_expense_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAJCzLvhV_iMt32txXiN9PzHIK4AWIFrIE",
    projectId: "organizing-web",
    messagingSenderId: "254996922098",
    appId: "1:254996922098:web:16d970bbe73fc5e3b1da6b",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: RecordeExpenseBindings(),
      home: const RecordeExpensePage(),
    );
  }
}
