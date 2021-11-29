import 'package:flutter/material.dart';
import 'model/assignment_model_5.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  Widget _buildButton(BuildContext context, String name, bool option) {
    return Container(
        width: 230,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(top: 10),
        color: Theme.of(context).colorScheme.primary,
        child: TextButton(
            child: Text(name,
                style: TextStyle(color: Theme.of(context).colorScheme.surface)),
            onPressed: () {
              Navigator.pop(context, option);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Setting")),
        body: Container(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              children: [
                Center(child: _buildButton(context, "Fix Second Screen", true)),
                Center(
                    child:
                        _buildButton(context, "Dynamic Second Screen", false)),
              ],
            )));
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String title = "Fix Title";
  String message = "Good Laptop";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    if (args.title.isEmpty == false) {
      title = args.title;
      message = args.message;
    }
    return Scaffold(
        appBar: AppBar(title: Text(title)),
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
              Text(message)
            ])));
  }
}
