class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class GalleryData {
  String? id;
  String? owner;
  String? server;
  String? title;
  String? ispublic;
  String? secret;

  GalleryData(this.id, this.owner, this.server, this.title, this.ispublic, this.secret);

  GalleryData.fromMap(Map data) {
    id = data["id"].toString();
    owner = data["owner"].toString();
    server = data["server"].toString();
    title = data["title"].toString();
    ispublic = data["ispublic"].toString();
    secret = data["secret"].toString();
  }
}
