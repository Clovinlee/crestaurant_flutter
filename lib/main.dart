import 'package:cflutter4/dependencies.dart';
import 'package:cflutter4/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800),
          headline2: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
          bodyText1: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
      home: const MainPage(),
    );
  }
}
