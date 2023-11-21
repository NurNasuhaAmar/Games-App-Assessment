class Screenshots {
  int? id;
  String? image;
  int? width;
  int? height;
  bool? isDeleted;

  Screenshots({this.id, this.image, this.width, this.height, this.isDeleted});

  Screenshots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    width = json['width'];
    height = json['height'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['width'] = width;
    data['height'] = height;
    data['is_deleted'] = isDeleted;
    return data;
  }
}

class ScreenshotsList {
  final List<Screenshots>? screenshotsList;

  ScreenshotsList({
    this.screenshotsList,
  });

  factory ScreenshotsList.fromJson(List<dynamic> parsedJson) {
    List<Screenshots> screenshotsList = [];
    screenshotsList = parsedJson.map((i) => Screenshots.fromJson(i)).toList();

    return ScreenshotsList(
      screenshotsList: screenshotsList,
    );
  }
}