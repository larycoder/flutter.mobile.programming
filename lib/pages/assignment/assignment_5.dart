import 'package:flutter/material.dart';

class Assignment5 extends StatelessWidget {
  const Assignment5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const MainScreen(),
      '/second': (context) => const SecondScreen(),
      '/setting': (context) => const SettingScreen()
    });
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Master Main Screen")),
        body: Center(
            child: Column(children: [
          GestureDetector(
              child: Hero(
                  tag: 'imageHero',
                  child: Image.network('https://picsum.photos/250?image=9')),
              onTap: () {
                Navigator.pushNamed(context, '/second');
              }),
          TextButton(
              child: const Text("setting"),
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              })
        ])));
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Setting")), body: const Text("TK"));
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Master Second Screen")),
        body: GestureDetector(
            child: Center(
                child: Hero(
                    tag: 'imageHero',
                    child: Image.network('https://picsum.photos/250?image=9'))),
            onTap: () {
              Navigator.pop(context);
            }));
  }
}
