import 'package:flutter/material.dart';
import './model/assignment_model_5.dart';
import './basic_view.dart';
import './gallery_view.dart';

class Assignment5 extends StatelessWidget {
  const Assignment5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const MainScreen(),
      '/second': (context) => const SecondScreen(),
      '/setting': (context) => const SettingScreen(currentFixedOpt: false),
      '/gallery': (context) => const GalleryScreen(),
    });
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool fixSecondScreen = false;

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

  Widget _buildButton(BuildContext context, String name, String routeName,
      Function? func, void Function(Object? opt) callback) {
    return TextButton(
        child: Text(name),
        onPressed: () {
          func ??= (() => ScreenArguments("", ""));
          Navigator.pushNamed(context, routeName, arguments: func!())
              .then(callback);
        });
  }

  Widget _buildButtonWithOnPress(String name, void Function() onPressed) {
    return TextButton(child: Text(name), onPressed: onPressed);
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
                final ScreenArguments arg;
                if (fixSecondScreen) {
                  arg = ScreenArguments("", "");
                } else {
                  arg = ScreenArguments(_collectText(titleController),
                      _collectText(messageController));
                }
                Navigator.pushNamed(context, '/second', arguments: arg);
              }),
          _buildButton(context, 'gallery', '/gallery', () {
            return ScreenArguments(
                _collectText(titleController), _collectText(messageController));
          }, (opt) {}),
          _buildButtonWithOnPress('setting', () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SettingScreen(currentFixedOpt: fixSecondScreen)))
                .then((opt) {
              fixSecondScreen = opt;
            });
          }),
          _buildTextForm("Title", titleController),
          _buildTextForm("Message", messageController)
        ])));
  }
}
