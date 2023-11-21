import 'package:base_app/model/details.dart';

class Platforms {
  Platform? platform;
  String? releasedAt;
  Requirements? requirements;

  Platforms({this.platform, this.releasedAt, this.requirements});

  Platforms.fromJson(Map<String, dynamic> json) {
    platform = json['platform'] != null
        ? Platform.fromJson(json['platform'])
        : null;
    releasedAt = json['released_at'];
    requirements = json['requirements'] != null
        ? Requirements.fromJson(json['requirements'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (platform != null) {
      data['platform'] = platform!.toJson();
    }
    data['released_at'] = releasedAt;
    if (requirements != null) {
      data['requirements'] = requirements!.toJson();
    }
    return data;
  }
}

class Platform {
  int? id;
  String? name;
  String? slug;
  String? image;
  int? yearEnd;
  int? yearStart;
  int? gamesCount;
  String? imageBackground;

  Platform(
      {this.id,
        this.name,
        this.slug,
        this.image,
        this.yearEnd,
        this.yearStart,
        this.gamesCount,
        this.imageBackground});

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    yearEnd = json['year_end'];
    yearStart = json['year_start'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['year_end'] = yearEnd;
    data['year_start'] = yearStart;
    data['games_count'] = gamesCount;
    data['image_background'] = imageBackground;
    return data;
  }
}