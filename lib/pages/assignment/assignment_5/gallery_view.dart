import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './model/assignment_model_5.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryState();
}

class _GalleryState extends State<GalleryScreen> {
  List<Widget> imageList = [];
  String searchKey = "cat";
  bool loadPage = false;

  Widget _buildGalleryElement(GalleryData content) {
    String server = content.server!;
    String id = content.id!;
    String secret = content.secret!;
    String title = content.title ?? "None";
    return Container(
        padding: const EdgeInsets.all(2),
        child: Column(children: [
          Container(
              margin: const EdgeInsets.all(5),
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://live.staticflickr.com/$server/${id}_${secret}_m.jpg")))),
          SizedBox(width: 250, height: 30, child: Center(child: Text(title)))
        ]));
  }

  Future<void> _buildDataList() async {
    List<Widget> galleryList = [];
    // setup gallery data
    GallerySource src = GallerySource();
    await src.loadMeta(100, searchKey);
    int len = src.dataList.length;

    // build layout from content
    for (var i = 0; i < len; i++) {
      galleryList.add(_buildGalleryElement(src.dataList[i]));
    }
    imageList = galleryList;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadPage = true;
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    if(loadPage) {
      searchKey = args.message;
      _buildDataList();
      loadPage = false;
    }
    return Scaffold(
        appBar: AppBar(title: const Text("Gallery")),
        body: GridView.count(
            primary: false,
            crossAxisCount: 2,
            children: imageList));
  }
}

class GallerySource {
  List<GalleryData> dataList = [];
  GallerySource({Key? key});

  Future<void> loadMeta(int page, String searchKey) async {
    var params = {
      "method": "flickr.photos.search",
      "api_key": "afc56e400102bc82433481c4371b9dde",
      "text": searchKey,
      "format": "json",
      "nojsoncallback": 1,
      "per_page": page
    };
    var queryList = [];
    params.forEach((key, value) {
      queryList.add("$key=$value");
    });
    String query = queryList.join("&");
    Uri url = Uri.parse("https://www.flickr.com/services/rest/?$query");
    String resp = await http.read(url);
    var meta = json.decode(resp)["photos"];
    final List photoList = meta["photo"];
    for (var el in photoList) {
      dataList.add(GalleryData.fromMap(el));
    }
  }
}
