import 'package:flutter/material.dart';
import 'model/assignment_model_5.dart';

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
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
        appBar: AppBar(title: Text(args.title)),
        body: Container(
            padding: const EdgeInsets.only(top: 100),
            child: Column(children: [
              GestureDetector(
                  child: Center(
                      child: Hero(
                          tag: 'imageHero',
                          child: Image.network(
                              'https://picsum.photos/250?image=9'))),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              Text(args.message)
            ])));
  }
}
