import 'package:flutter/material.dart';
import 'package:intro/mainpage.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key1 = GlobalKey();
  final _key2 = GlobalKey();
  final _key3 = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)!.startShowCase(
        [
          _key1,
          _key2,
          _key3,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [const Icon(Icons.abc)]),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.red,
          items: [
            const BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
                icon: Showcase(
                    overlayPadding: const EdgeInsets.all(20),
                    contentPadding: const EdgeInsets.all(50),
                    key: _key1,
                    description:
                        "Search new recipes Or\n meet new interesting people",
                    child: const Icon(Icons.search)),
                label: ""),
            BottomNavigationBarItem(
                icon: Showcase(
                    overlayPadding: const EdgeInsets.all(20),
                    contentPadding: const EdgeInsets.all(50),
                    key: _key2,
                    description:
                        "Easily create a recipe that you may share with your followers or family",
                    child: const Icon(Icons.add_circle_outline_rounded)),
                label: ""),
            BottomNavigationBarItem(
                icon: Showcase(
                    disposeOnTap: true,
                    onTargetClick: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Main(),
                            ));
                      });
                    },
                    overlayPadding: const EdgeInsets.all(20),
                    contentPadding: const EdgeInsets.all(50),
                    key: _key3,
                    description:
                        "Edit your profile,add familyor explore your liked recipes",
                    child: const Icon(Icons.person)),
                label: ""),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: ""),
          ]),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Main(),
                    ));
              },
              child: Text("Get Started"))),
    );
  }
}
