class Album {
  int albumId;
  int id;
  String title;

  Album({this.albumId, this.id, this.title});

  Album.fromJson(Map<String, dynamic> json) {
    albumId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}