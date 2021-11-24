import 'package:flutter/material.dart';

class Assignment2 extends StatelessWidget {
  const Assignment2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text("Master Title")),
            body: SafeArea(
                child: Stack(children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.deepOrangeAccent),
              Column(children: [
                Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(top: 20),
                    child: const CircleAvatar(
                        radius: 60,
                        child: Icon(
                          Icons.face,
                          size: 120,
                        ))),
                const SizedBox(height: 30),
                const Text("Bonjour, common cava ?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("Product of Student master",
                    style: Theme.of(context).textTheme.subtitle1)
              ]),
              Container(
                  margin: const EdgeInsets.only(top: 260),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 100,
                  width: double.infinity,
                  child: Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Photo',
                                      style: TextStyle(color: Colors.black54)),
                                  Text('5.000',
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 16))
                                ]),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Followers',
                                      style: TextStyle(color: Colors.black54)),
                                  Text('5.000',
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 16))
                                ]),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Favorites',
                                      style: TextStyle(color: Colors.black54)),
                                  Text('5.000',
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 16))
                                ])
                          ]),
                      color: Colors.white,
                      elevation: 3))
            ]))));
  }
}
