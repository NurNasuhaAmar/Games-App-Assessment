import 'package:base_app/model/platforms.dart';

class GameDetails {
  int? id;
  String? slug;
  String? name;
  String? nameOriginal;
  String? description;
  int? metacritic;
  List<MetacriticPlatforms>? metacriticPlatforms;
  String? released;
  bool? tba;
  String? updated;
  String? backgroundImage;
  String? backgroundImageAdditional;
  String? website;
  double? rating;
  int? ratingTop;
  List<Ratings>? ratings;
  int? added;
  int? playtime;
  int? screenshotsCount;
  int? moviesCount;
  int? creatorsCount;
  int? achievementsCount;
  int? parentAchievementsCount;
  String? redditUrl;
  String? redditName;
  String? redditDescription;
  String? redditLogo;
  int? redditCount;
  int? twitchCount;
  int? youtubeCount;
  int? reviewsTextCount;
  int? ratingsCount;
  int? suggestionsCount;
  String? metacriticUrl;
  int? parentsCount;
  int? additionsCount;
  int? gameSeriesCount;
  int? reviewsCount;
  String? saturatedColor;
  String? dominantColor;
  List<ParentPlatforms>? parentPlatforms;
  List<Platforms>? platforms;
  List<Stores>? stores;
  List<Developers>? developers;
  List<Genres>? genres;
  List<Publishers>? publishers;
  Platform? esrbRating;
  String? descriptionRaw;

  GameDetails(
      {this.id,
        this.slug,
        this.name,
        this.nameOriginal,
        this.description,
        this.metacritic,
        this.metacriticPlatforms,
        this.released,
        this.tba,
        this.updated,
        this.backgroundImage,
        this.backgroundImageAdditional,
        this.website,
        this.rating,
        this.ratingTop,
        this.ratings,
        this.added,
        this.playtime,
        this.screenshotsCount,
        this.moviesCount,
        this.creatorsCount,
        this.achievementsCount,
        this.parentAchievementsCount,
        this.redditUrl,
        this.redditName,
        this.redditDescription,
        this.redditLogo,
        this.redditCount,
        this.twitchCount,
        this.youtubeCount,
        this.reviewsTextCount,
        this.ratingsCount,
        this.suggestionsCount,
        this.metacriticUrl,
        this.parentsCount,
        this.additionsCount,
        this.gameSeriesCount,
        this.reviewsCount,
        this.saturatedColor,
        this.dominantColor,
        this.parentPlatforms,
        this.platforms,
        this.stores,
        this.developers,
        this.genres,
        this.publishers,
        this.esrbRating,
        this.descriptionRaw});

  GameDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    nameOriginal = json['name_original'];
    description = json['description'];
    metacritic = json['metacritic'];
    if (json['metacritic_platforms'] != null) {
      metacriticPlatforms = <MetacriticPlatforms>[];
      json['metacritic_platforms'].forEach((v) {
        metacriticPlatforms!.add(MetacriticPlatforms.fromJson(v));
      });
    }
    released = json['released'];
    tba = json['tba'];
    updated = json['updated'];
    backgroundImage = json['background_image'];
    backgroundImageAdditional = json['background_image_additional'];
    website = json['website'];
    rating = json['rating'];
    ratingTop = json['rating_top'];
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(Ratings.fromJson(v));
      });
    }
    added = json['added'];
    playtime = json['playtime'];
    screenshotsCount = json['screenshots_count'];
    moviesCount = json['movies_count'];
    creatorsCount = json['creators_count'];
    achievementsCount = json['achievements_count'];
    parentAchievementsCount = json['parent_achievements_count'];
    redditUrl = json['reddit_url'];
    redditName = json['reddit_name'];
    redditDescription = json['reddit_description'];
    redditLogo = json['reddit_logo'];
    redditCount = json['reddit_count'];
    twitchCount = json['twitch_count'];
    youtubeCount = json['youtube_count'];
    reviewsTextCount = json['reviews_text_count'];
    ratingsCount = json['ratings_count'];
    suggestionsCount = json['suggestions_count'];
    metacriticUrl = json['metacritic_url'];
    parentsCount = json['parents_count'];
    additionsCount = json['additions_count'];
    gameSeriesCount = json['game_series_count'];
    reviewsCount = json['reviews_count'];
    saturatedColor = json['saturated_color'];
    dominantColor = json['dominant_color'];
    if (json['parent_platforms'] != null) {
      parentPlatforms = <ParentPlatforms>[];
      json['parent_platforms'].forEach((v) {
        parentPlatforms!.add(ParentPlatforms.fromJson(v));
      });
    }
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
    if (json['developers'] != null) {
      developers = <Developers>[];
      json['developers'].forEach((v) {
        developers!.add(Developers.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    if (json['publishers'] != null) {
      publishers = <Publishers>[];
      json['publishers'].forEach((v) {
        publishers!.add(Publishers.fromJson(v));
      });
    }
    esrbRating = json['esrb_rating'] != null
        ? Platform.fromJson(json['esrb_rating'])
        : null;
    descriptionRaw = json['description_raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['name_original'] = nameOriginal;
    data['description'] = description;
    data['metacritic'] = metacritic;
    if (metacriticPlatforms != null) {
      data['metacritic_platforms'] =
          metacriticPlatforms!.map((v) => v.toJson()).toList();
    }
    data['released'] = released;
    data['tba'] = tba;
    data['updated'] = updated;
    data['background_image'] = backgroundImage;
    data['background_image_additional'] = backgroundImageAdditional;
    data['website'] = website;
    data['rating'] = rating;
    data['rating_top'] = ratingTop;
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    data['added'] = added;
    data['playtime'] = playtime;
    data['screenshots_count'] = screenshotsCount;
    data['movies_count'] = moviesCount;
    data['creators_count'] = creatorsCount;
    data['achievements_count'] = achievementsCount;
    data['parent_achievements_count'] = parentAchievementsCount;
    data['reddit_url'] = redditUrl;
    data['reddit_name'] = redditName;
    data['reddit_description'] = redditDescription;
    data['reddit_logo'] = redditLogo;
    data['reddit_count'] = redditCount;
    data['twitch_count'] = twitchCount;
    data['youtube_count'] = youtubeCount;
    data['reviews_text_count'] = reviewsTextCount;
    data['ratings_count'] = ratingsCount;
    data['suggestions_count'] = suggestionsCount;
    data['metacritic_url'] = metacriticUrl;
    data['parents_count'] = parentsCount;
    data['additions_count'] = additionsCount;
    data['game_series_count'] = gameSeriesCount;
    data['reviews_count'] = reviewsCount;
    data['saturated_color'] = saturatedColor;
    data['dominant_color'] = dominantColor;
    if (parentPlatforms != null) {
      data['parent_platforms'] =
          parentPlatforms!.map((v) => v.toJson()).toList();
    }
    if (platforms != null) {
      data['platforms'] = platforms!.map((v) => v.toJson()).toList();
    }
    if (stores != null) {
      data['stores'] = stores!.map((v) => v.toJson()).toList();
    }
    if (developers != null) {
      data['developers'] = developers!.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (publishers != null) {
      data['publishers'] = publishers!.map((v) => v.toJson()).toList();
    }
    if (esrbRating != null) {
      data['esrb_rating'] = esrbRating!.toJson();
    }
    data['description_raw'] = descriptionRaw;
    return data;
  }
}

class MetacriticPlatforms {
  int? metascore;
  String? url;
  Platform? platform;

  MetacriticPlatforms({this.metascore, this.url, this.platform});

  MetacriticPlatforms.fromJson(Map<String, dynamic> json) {
    metascore = json['metascore'];
    url = json['url'];
    platform = json['platform'] != null
        ? Platform.fromJson(json['platform'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['metascore'] = metascore;
    data['url'] = url;
    if (platform != null) {
      data['platform'] = platform!.toJson();
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

class ParentPlatforms {
  Platform? platform;

  ParentPlatforms({this.platform});

  ParentPlatforms.fromJson(Map<String, dynamic> json) {
    platform = json['platform'] != null
        ? Platform.fromJson(json['platform'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (platform != null) {
      data['platform'] = platform!.toJson();
    }
    return data;
  }
}

class Requirements {
  String? minimum;
  String? recommended;

  Requirements({this.minimum, this.recommended});

  Requirements.fromJson(Map<String, dynamic> json) {
    minimum = json['minimum'];
    recommended = json['recommended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['minimum'] = minimum;
    data['recommended'] = recommended;
    return data;
  }
}

class Stores {
  int? id;
  String? url;
  Store? store;

  Stores({this.id, this.url, this.store});

  Stores.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    if (store != null) {
      data['store'] = store!.toJson();
    }
    return data;
  }
}

class Store {
  int? id;
  String? name;
  String? slug;
  String? domain;
  int? gamesCount;
  String? imageBackground;

  Store(
      {this.id,
        this.name,
        this.slug,
        this.domain,
        this.gamesCount,
        this.imageBackground});

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    domain = json['domain'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['domain'] = domain;
    data['games_count'] = gamesCount;
    data['image_background'] = imageBackground;
    return data;
  }
}

class Developers {
  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;

  Developers(
      {this.id, this.name, this.slug, this.gamesCount, this.imageBackground});

  Developers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    gamesCount = json['games_count'];
    imageBackground = json['image_background'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['games_count'] = gamesCount;
    data['image_background'] = imageBackground;
    return data;
  }
}

class Genres {
  int? id;
  String? name;
  String? slug;

  Genres(
      {this.id,
        this.name,
        this.slug,});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}

class Publishers {
  int? id;
  String? name;
  String? slug;

  Publishers(
      {this.id,
        this.name,
        this.slug,});

  Publishers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    return data;
  }
}