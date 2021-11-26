import 'package:flutter/material.dart';

class _LayoutState extends State<MyLayout> {
  int number = 0;

  void _triggleCount() {
    setState((){
      number += 1;
    });
  }

  Widget _buildIcon() {
    return Column(children: [
      IconButton(
          iconSize: 50, icon: const Icon(Icons.add), onPressed: _triggleCount),
      Text("$number")
    ]);
  }

  Widget _buildButton(double padValue) {
    return Container(
        padding: EdgeInsets.only(top: padValue),
        child: Center(child: _buildIcon()));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 792) {
        return Scaffold(
            drawer: const Drawer(child: Scaffold()),
            appBar: AppBar(title: const Text("horizontal data")),
            body: _buildButton(100));
      } else {
        return Scaffold(
            drawer: const Drawer(child: Scaffold()),
            appBar: AppBar(title: const Text("vertical data")),
            body: _buildButton(300));
      }
    });
  }
}

class MyLayout extends StatefulWidget {
  const MyLayout({Key? key}) : super(key: key);

  @override
  _LayoutState createState() => _LayoutState();
}

class Assignment4 extends StatelessWidget {
  const Assignment4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MyLayout());
  }
}
