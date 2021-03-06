import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_app/controller/main_controller.dart';
import 'package:flutter_web_app/pages/home_page.dart';
import 'package:flutter_web_app/pages/m_home_page.dart';
import 'package:get/get.dart';

Future main() async {
  await dotenv.load(fileName: "env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final mc = Get.put(MainController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ersel (ProFuNn) Ertekin + ${dotenv.env['test']}',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: mc.desktop ? Colors.blue : Colors.green,
      ),
      home: mc.desktop ? const HomePage() : const MHomePage(),
    );
  }
}
