import 'package:flutter/material.dart';
import 'package:intro/Homepage.dart';
import 'package:intro/mainpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final showHome = prefs.getBool("showHome") ?? false;
  runApp(MyApp(
    showHome: showHome,
  ));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final bool showHome;
  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    void save() async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("showHome", true);
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => Main(),
      //     ));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: showHome
          ? Main()
          : ShowCaseWidget(
              onComplete: (index, key) => main(),
              onFinish: save,
              builder: Builder(
                builder: (context) => const HomePage(),
              ),
            ),
    );
  }
}
