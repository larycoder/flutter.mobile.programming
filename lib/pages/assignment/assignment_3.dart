import 'package:flutter/material.dart';

class Assignment3 extends StatelessWidget {
  const Assignment3({Key? key}) : super(key: key);

  Widget _buildTitleSection() {
    return Container(
        padding: const EdgeInsets.all(32),
        child: Row(children: [
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text("Oeschinen Lake Campground",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Text("Kandersteg, Switzerland",
                    style: TextStyle(color: Colors.grey[500]))
              ])),
          const FavoriteWidget(),
        ]));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400, color: color)))
        ]);
  }

  Widget _buildButtonSection(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _buildButtonColumn(color, Icons.call, "CALL"),
      _buildButtonColumn(color, Icons.near_me, "ROUTE"),
      _buildButtonColumn(color, Icons.share, "SHARE"),
    ]);
  }

  Widget _buildTextSection() {
    return const Padding(
        padding: EdgeInsets.all(32),
        child: Text(
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese'
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true));
  }

  Widget _buildImageSection() {
    return Image.asset('lib/pages/assignment/images/lake.jpg',
        width: 600, height: 240, fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "USTH Master",
        home: Scaffold(
            appBar: AppBar(title: const Text("Mobile Programming")),
            body: Column(children: [
              _buildImageSection(),
              _buildTitleSection(),
              _buildButtonSection(context),
              _buildTextSection()
            ])));
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidget createState() => _FavoriteWidget();
}

class _FavoriteWidget extends State<FavoriteWidget> {
  bool _isFavorite = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
        _favoriteCount -= 1;
      } else {
        _isFavorite = true;
        _favoriteCount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorite
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          )),
      SizedBox(
          /* maybe need one more SizedBox */
          width: 18,
          child: Text('$_favoriteCount'))
    ]);
  }
}
