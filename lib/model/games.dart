import 'package:base_app/model/platforms.dart';

class Games {
  String? slug;
  String? name;
  int? playtime;
  List<Platforms>? platforms;
  List<Stores>? stores;
  String? released;
  bool? tba;
  String? backgroundImage;
  double? rating;
  int? ratingTop;
  List<Ratings>? ratings;
  int? ratingsCount;
  int? reviewsTextCount;
  int? added;
  AddedByStatus? addedByStatus;
  int? metacritic;
  int? suggestionsCount;
  String? updated;
  int? id;
  List<Tags>? tags;
  EsrbRating? esrbRating;
  int? reviewsCount;
  int? communityRating;
  String? saturatedColor;
  String? dominantColor;
  List<ShortScreenshots>? shortScreenshots;

  Games(
      {this.slug,
        this.name,
        this.playtime,
        this.platforms,
        this.stores,
        this.released,
        this.tba,
        this.backgroundImage,
        this.rating,
        this.ratingTop,
        this.ratings,
        this.ratingsCount,
        this.reviewsTextCount,
        this.added,
        this.addedByStatus,
        this.metacritic,
        this.suggestionsCount,
        this.updated,
        this.id,
        this.tags,
        this.esrbRating,
        this.reviewsCount,
        this.communityRating,
        this.saturatedColor,
        this.dominantColor,
        this.shortScreenshots,
      });

  Games.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    playtime = json['playtime'];
    if (json['platforms'] != null) {
      platforms = <Platforms>[];
      json['platforms'].forEach((v) {
        platforms!.add(Platforms.fromJson(v));
      });
    }
    if (json['stores'] != null) {
      stores = <Stores>[];
      json['stores'].forEach((v) {
        stores!.add(Stores.fromJson(v));
      });
    }
    released = json['released'];
    tba = json['tba'];
    backgroundImage = json['background_image'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(Ratings.fromJson(v));
      });
    }
    ratingsCount = json['ratings_count'];
    reviewsTextCount = json['reviews_text_count'];
    added = json['added'];
    addedByStatus = json['added_by_status'] != null
        ? AddedByStatus.fromJson(json['added_by_status'])
        : null;
    metacritic = json['metacritic'];
    suggestionsCount = json['suggestions_count'];
    updated = json['updated'];
    id = json['id'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    esrbRating = json['esrb_rating'] != null
        ? EsrbRating.fromJson(json['esrb_rating'])
        : null;
    reviewsCount = json['reviews_count'];
    communityRating = json['community_rating'];
    saturatedColor = json['saturated_color'];
    dominantColor = json['dominant_color'];
    if (json['short_screenshots'] != null) {
      shortScreenshots = <ShortScreenshots>[];
      json['short_screenshots'].forEach((v) {
        shortScreenshots!.add(ShortScreenshots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['name'] = name;
    data['playtime'] = playtime;
    if (platforms != null) {
      data['platforms'] = platforms!.map((v) => v.toJson()).toList();
    }
    if (stores != null) {
      data['stores'] = stores!.map((v) => v.toJson()).toList();
    }
    data['released'] = released;
    data['tba'] = tba;
    data['background_image'] = backgroundImage;
    data['rating'] = rating;
    data['rating_top'] = ratingTop;
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    data['ratings_count'] = ratingsCount;
    data['reviews_text_count'] = reviewsTextCount;
    data['added'] = added;
    if (addedByStatus != null) {
      data['added_by_status'] = addedByStatus!.toJson();
    }
    data['metacritic'] = metacritic;
    data['suggestions_count'] = suggestionsCount;
    data['updated'] = updated;
    data['id'] = id;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (esrbRating != null) {
      data['esrb_rating'] = esrbRating!.toJson();
    }
    data['reviews_count'] = reviewsCount;
    data['community_rating'] = communityRating;
    data['saturated_color'] = saturatedColor;
    data['dominant_color'] = dominantColor;
    if (shortScreenshots != null) {
      data['short_screenshots'] =
          shortScreenshots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GamesList {
  final List<Games>? gamesList;

  GamesList({
    this.gamesList,
  });

  factory GamesList.fromJson(List<dynamic> parsedJson) {
    List<Games> gamesList = [];
    gamesList = parsedJson.map((i) => Games.fromJson(i)).toList();

    return GamesList(
      gamesList: gamesList,
    );
  }
}

class Stores {
  Platform? store;

  Stores({this.store});

  Stores.fromJson(Map<String, dynamic> json) {
    store = json['store'] != null ? Platform.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (store != null) {
      data['store'] = store!.toJson();
    }
    return data;
  }
}

class Ratings {
  int? id;
  String? title;
  int? count;
  double? percent;

  Ratings({this.id, this.title, this.count, this.percent});

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    count = json['count'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['count'] = count;
    data['percent'] = percent;
    return data;
  }
}

class AddedByStatus {
  int? owned;
  int? yet;
  int? beaten;
  int? toplay;
  int? playing;
  int? dropped;

  AddedByStatus(
      {this.owned,
        this.yet,
        this.beaten,
        this.toplay,
        this.playing,
        this.dropped});

  AddedByStatus.fromJson(Map<String, dynamic> json) {
    owned = json['owned'];
    yet = json['yet'];
    beaten = json['beaten'];
    toplay = json['toplay'];
    playing = json['playing'];
    dropped = json['dropped'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['owned'] = owned;
    data['yet'] = yet;
    data['beaten'] = beaten;
    data['toplay'] = toplay;
    data['playing'] = playing;
    data['dropped'] = dropped;
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  String? slug;
  String? language;
  int? gamesCount;
  String? imageBackground;

  Tags(
      {this.id,
        this.name,
        this.slug,
        this.language,
        this.gamesCount,
        this.imageBackground});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    language = json['language'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['language'] = language;
    data['games_count'] = gamesCount;
    data['image_background'] = imageBackground;
    return data;
  }
}

class EsrbRating {
  int? id;
  String? name;
  String? slug;
  String? nameEn;
  String? nameRu;

  EsrbRating({this.id, this.name, this.slug, this.nameEn, this.nameRu});

  EsrbRating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    nameEn = json['name_en'];
    nameRu = json['name_ru'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['name_en'] = nameEn;
    data['name_ru'] = nameRu;
    return data;
  }
}

class ShortScreenshots {
  int? id;
  String? image;

  ShortScreenshots({this.id, this.image});

  ShortScreenshots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}


// class Games {
//   final int? id;
//   final String? name;
//   final String? description;
//   final String? position;
//   final String? score;
//   final String? rate;
//   final int? scoring;
//
//   Games({this.id, this.name, this.description, this.position, this.score, this.rate, this.scoring});
//
//   factory Games.fromJson(Map<String, dynamic> json) {
//     return Games(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       description: json['description'] ?? '',
//       position: json['position']?.toString() ?? '',
//       score: json['score']?.toString() ?? '',
//       rate: json['rate']?.toString() ?? '',
//       scoring: int.parse((json['scoring'] == true ? 1 : (json['scoring'] == false ? 0 : json['scoring'] ?? 0)).toString()),
//     );
//   }
// }
//
// class GamesList {
//   final Map<String, Games>? gamesList;
//
//   GamesList({this.gamesList});
//
//   factory GamesList.fromJson(Map<String, dynamic> parsedJson) {
//     Map<String, Games> gamesList = <String, Games>{};
//     parsedJson.forEach((key, value) {
//       var games = Games.fromJson(value);
//       gamesList.addAll({key: games});
//     });
//
//     return GamesList(gamesList: gamesList);
//   }
// }
