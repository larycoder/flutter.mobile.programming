import 'package:flutter/material.dart';
import './model/assignment_model_5.dart';
import './basic_view.dart';

class Assignment5 extends StatelessWidget {
  const Assignment5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const MainScreen(),
      '/second': (context) => const SecondScreen(),
      '/setting': (context) => const SettingScreen(),
    });
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  Widget _buildTextForm(String name, TextEditingController controller) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            border: const UnderlineInputBorder(), labelText: name));
  }

  String _collectText(TextEditingController controller) {
    String text = controller.text;
    //controller.clear();
    return text;
  }

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var messageController = TextEditingController();
    return Scaffold(
        appBar: AppBar(title: const Text("Master Main Screen")),
        body: Center(
            child: Column(children: [
          GestureDetector(
              child: Hero(
                  tag: 'imageHero',
                  child: Image.network('https://picsum.photos/250?image=9')),
              onTap: () {
                Navigator.pushNamed(context, '/second',
                    arguments: ScreenArguments(_collectText(titleController),
                        _collectText(messageController)));
              }),
          TextButton(
              child: const Text("setting"),
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              }),
          _buildTextForm("Title", titleController),
          _buildTextForm("Message", messageController)
        ])));
  }
}
