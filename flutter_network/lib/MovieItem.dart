// To parse this JSON data, do
//
//     final movieItem = movieItemFromJson(jsonString);

import 'dart:convert';

MovieItem movieItemFromJson(String str) => MovieItem.fromJson(json.decode(str));

String movieItemToJson(MovieItem data) => json.encode(data.toJson());

class MovieItem {
  MovieItem({
    this.count,
    required this.subjectCollection,
    this.subjectCollectionItems,
    this.total,
    this.start,
  });

  int? count;
  SubjectCollection? subjectCollection;
  List<SubjectCollectionItem>? subjectCollectionItems;
  int? total;
  int? start;

  factory MovieItem.fromJson(Map<String, dynamic> json) => MovieItem(
    count: json["count"],
    subjectCollection: SubjectCollection.fromJson(json["subject_collection"]),
    subjectCollectionItems: List<SubjectCollectionItem>.from(json["subject_collection_items"].map((x) => SubjectCollectionItem.fromJson(x))),
    total: json["total"],
    start: json["start"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "subject_collection": subjectCollection?.toJson(),
    "subject_collection_items": List<dynamic>.from(subjectCollectionItems!.map((x) => x.toJson())),
    "total": total,
    "start": start,
  };
}

class SubjectCollection {
  SubjectCollection({
    this.subjectType = "",
    this.subtitle,
    this.backgroundColorScheme,
    this.sharingTitle,
    this.updatedAt,
    this.screenshotTitle,
    this.screenshotUrl,
    this.total,
    this.screenshotType,
    this.id,
    this.name,
    this.showHeaderMask,
    this.mediumName,
    this.badge,
    this.description,
    this.shortName,
    this.nFollowers,
    this.coverUrl,
    this.showRank,
    this.doneCount,
    this.sharingUrl,
    this.subjectCount,
    this.wechatTimelineShare,
    this.collectCount,
    this.url,
    this.uri,
    this.miniProgramPage,
    this.iconFgImage,
    this.moreDescription,
    this.miniProgramName,
    this.display,
  });

  String? subjectType;
  String? subtitle;
  BackgroundColorScheme? backgroundColorScheme;
  String? sharingTitle;
  dynamic updatedAt;
  String? screenshotTitle;
  String? screenshotUrl;
  int? total;
  String? screenshotType;
  String? id;
  String? name;
  bool? showHeaderMask;
  String? mediumName;
  dynamic badge;
  String? description;
  String? shortName;
  dynamic nFollowers;
  String? coverUrl;
  bool? showRank;
  int? doneCount;
  String? sharingUrl;
  int? subjectCount;
  String? wechatTimelineShare;
  int? collectCount;
  String? url;
  String? uri;
  String? miniProgramPage;
  String? iconFgImage;
  String? moreDescription;
  String? miniProgramName;
  Display? display;

  factory SubjectCollection.fromJson(Map<String, dynamic> json) => SubjectCollection(
    subjectType: json["subject_type"],
    subtitle: json["subtitle"],
    backgroundColorScheme: BackgroundColorScheme.fromJson(json["background_color_scheme"]),
    sharingTitle: json["sharing_title"],
    updatedAt: json["updated_at"],
    screenshotTitle: json["screenshot_title"],
    screenshotUrl: json["screenshot_url"],
    total: json["total"],
    screenshotType: json["screenshot_type"],
    id: json["id"],
    name: json["name"],
    showHeaderMask: json["show_header_mask"],
    mediumName: json["medium_name"],
    badge: json["badge"],
    description: json["description"],
    shortName: json["short_name"],
    nFollowers: json["n_followers"],
    coverUrl: json["cover_url"],
    showRank: json["show_rank"],
    doneCount: json["done_count"],
    sharingUrl: json["sharing_url"],
    subjectCount: json["subject_count"],
    wechatTimelineShare: json["wechat_timeline_share"],
    collectCount: json["collect_count"],
    url: json["url"],
    uri: json["uri"],
    miniProgramPage: json["mini_program_page"],
    iconFgImage: json["icon_fg_image"],
    moreDescription: json["more_description"],
    miniProgramName: json["mini_program_name"],
    display: Display.fromJson(json["display"]),
  );

  Map<String, dynamic> toJson() => {
    "subject_type": subjectType,
    "subtitle": subtitle,
    "background_color_scheme": backgroundColorScheme?.toJson(),
    "sharing_title": sharingTitle,
    "updated_at": updatedAt,
    "screenshot_title": screenshotTitle,
    "screenshot_url": screenshotUrl,
    "total": total,
    "screenshot_type": screenshotType,
    "id": id,
    "name": name,
    "show_header_mask": showHeaderMask,
    "medium_name": mediumName,
    "badge": badge,
    "description": description,
    "short_name": shortName,
    "n_followers": nFollowers,
    "cover_url": coverUrl,
    "show_rank": showRank,
    "done_count": doneCount,
    "sharing_url": sharingUrl,
    "subject_count": subjectCount,
    "wechat_timeline_share": wechatTimelineShare,
    "collect_count": collectCount,
    "url": url,
    "uri": uri,
    "mini_program_page": miniProgramPage,
    "icon_fg_image": iconFgImage,
    "more_description": moreDescription,
    "mini_program_name": miniProgramName,
    "display": display?.toJson(),
  };
}

class BackgroundColorScheme {
  BackgroundColorScheme({
    this.isDark,
    this.primaryColorLight,
    this.secondaryColor,
    this.primaryColorDark,
  });

  bool? isDark;
  String? primaryColorLight;
  String? secondaryColor;
  String? primaryColorDark;

  factory BackgroundColorScheme.fromJson(Map<String, dynamic> json) => BackgroundColorScheme(
    isDark: json["is_dark"],
    primaryColorLight: json["primary_color_light"],
    secondaryColor: json["secondary_color"],
    primaryColorDark: json["primary_color_dark"],
  );

  Map<String, dynamic> toJson() => {
    "is_dark": isDark,
    "primary_color_light": primaryColorLight,
    "secondary_color": secondaryColor,
    "primary_color_dark": primaryColorDark,
  };
}

class Display {
  Display({
    this.layout,
  });

  String? layout;

  factory Display.fromJson(Map<String, dynamic> json) => Display(
    layout: json["layout"],
  );

  Map<String, dynamic> toJson() => {
    "layout": layout,
  };
}

class SubjectCollectionItem {
  SubjectCollectionItem({
    this.originalPrice,
    this.rating,
    this.cover,
    this.actions,
    this.year,
    this.cardSubtitle,
    this.id,
    this.title,
    this.comments,
    this.label,
    this.actors,
    this.interest,
    this.type,
    this.description,
    this.hasLinewatch,
    this.price,
    this.date,
    this.info,
    this.ratingData,
    this.url,
    this.releaseDate,
    this.originalTitle,
    this.uri,
    this.subtype,
    this.directors,
    this.reviewerName,
    this.nullRatingReason,
  });

  dynamic originalPrice;
  Rating? rating;
  Cover? cover;
  List<String>? actions;
  String? year;
  String? cardSubtitle;
  String? id;
  String? title;
  List<Comment>? comments;
  dynamic label;
  List<String>? actors;
  dynamic interest;
  Type? type;
  String? description;
  bool? hasLinewatch;
  dynamic price;
  dynamic date;
  String? info;
  RatingData? ratingData;
  String? url;
  String? releaseDate;
  String? originalTitle;
  String? uri;
  String? subtype;
  List<String>? directors;
  String? reviewerName;
  NullRatingReason? nullRatingReason;

  factory SubjectCollectionItem.fromJson(Map<String, dynamic> json) => SubjectCollectionItem(
    originalPrice: json["original_price"],
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    cover: Cover.fromJson(json["cover"]),
    actions: List<String>.from(json["actions"].map((x) => x)),
    year: json["year"],
    cardSubtitle: json["card_subtitle"],
    id: json["id"],
    title: json["title"],
    comments: json["comments"] == null ? null : List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    label: json["label"],
    actors: List<String>.from(json["actors"].map((x) => x)),
    interest: json["interest"],
    type: typeValues.map[json["type"]],
    description: json["description"],
    hasLinewatch: json["has_linewatch"],
    price: json["price"],
    date: json["date"],
    info: json["info"],
    ratingData: json["rating_data"] == null ? null : RatingData.fromJson(json["rating_data"]),
    url: json["url"],
    releaseDate: json["release_date"],
    originalTitle: json["original_title"],
    uri: json["uri"],
    subtype: json["subtype"],
    directors: List<String>.from(json["directors"].map((x) => x)),
    reviewerName: json["reviewer_name"],
    nullRatingReason: nullRatingReasonValues.map[json["null_rating_reason"]],
  );

  Map<String, dynamic> toJson() => {
    "original_price": originalPrice,
    "rating": rating?.toJson(),
    "cover": cover?.toJson(),
    "actions": List<dynamic>.from(actions!.map((x) => x)),
    "year": year,
    "card_subtitle": cardSubtitle,
    "id": id,
    "title": title,
    "comments": comments == null ? null : List<dynamic>.from(comments!.map((x) => x.toJson())),
    "label": label,
    "actors": List<dynamic>.from(actors!.map((x) => x)),
    "interest": interest,
    "type": typeValues.reverse?[type],
    "description": description,
    "has_linewatch": hasLinewatch,
    "price": price,
    "date": date,
    "info": info,
    "rating_data": ratingData?.toJson(),
    "url": url,
    "release_date": releaseDate,
    "original_title": originalTitle,
    "uri": uri,
    "subtype": subtype,
    "directors": List<dynamic>.from(directors!.map((x) => x)),
    "reviewer_name": reviewerName,
    "null_rating_reason": nullRatingReasonValues.reverse?[nullRatingReason],
  };

  @override
  String toString() {
    return 'SubjectCollectionItem{cardSubtitle: $cardSubtitle}';
  }
}

class Comment {
  Comment({
    this.comment,
    this.rating,
    this.sharingUrl,
    this.isVoted,
    this.uri,
    this.platforms,
    this.voteCount,
    this.createTime,
    this.status,
    this.user,
    this.id,
    this.wechatTimelineShare,
  });

  String? comment;
  Rating? rating;
  String? sharingUrl;
  bool? isVoted;
  String? uri;
  List<dynamic>? platforms;
  int? voteCount;
  DateTime? createTime;
  String? status;
  User? user;
  String? id;
  String? wechatTimelineShare;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    comment: json["comment"],
    rating: Rating.fromJson(json["rating"]),
    sharingUrl: json["sharing_url"],
    isVoted: json["is_voted"],
    uri: json["uri"],
    platforms: List<dynamic>.from(json["platforms"].map((x) => x)),
    voteCount: json["vote_count"],
    createTime: DateTime.parse(json["create_time"]),
    status: json["status"],
    user: User.fromJson(json["user"]),
    id: json["id"],
    wechatTimelineShare: json["wechat_timeline_share"],
  );

  Map<String, dynamic> toJson() => {
    "comment": comment,
    "rating": rating?.toJson(),
    "sharing_url": sharingUrl,
    "is_voted": isVoted,
    "uri": uri,
    "platforms": List<dynamic>.from(platforms!.map((x) => x)),
    "vote_count": voteCount,
    "create_time": createTime?.toIso8601String(),
    "status": status,
    "user": user?.toJson(),
    "id": id,
    "wechat_timeline_share": wechatTimelineShare,
  };
}

class Rating {
  Rating({
    this.count,
    this.max,
    this.starCount,
    this.value,
  });

  int? count;
  int? max;
  double? starCount;
  double? value;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    count: json["count"],
    max: json["max"],
    starCount: json["star_count"].toDouble(),
    value: json["value"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "max": max,
    "star_count": starCount,
    "value": value,
  };
}

class User {
  User({
    this.loc,
    this.kind,
    this.followed,
    this.name,
    this.inBlacklist,
    this.url,
    this.gender,
    this.regTime,
    this.uri,
    this.remark,
    this.avatar,
    this.type,
    this.id,
    this.uid,
  });

  Loc? loc;
  String? kind;
  bool? followed;
  String? name;
  bool? inBlacklist;
  String? url;
  String? gender;
  DateTime? regTime;
  String? uri;
  String? remark;
  String? avatar;
  String? type;
  String? id;
  String? uid;

  factory User.fromJson(Map<String, dynamic> json) => User(
    loc: Loc.fromJson(json["loc"]),
    kind: json["kind"],
    followed: json["followed"],
    name: json["name"],
    inBlacklist: json["in_blacklist"],
    url: json["url"],
    gender: json["gender"],
    regTime: DateTime.parse(json["reg_time"]),
    uri: json["uri"],
    remark: json["remark"],
    avatar: json["avatar"],
    type: json["type"],
    id: json["id"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "loc": loc?.toJson(),
    "kind": kind,
    "followed": followed,
    "name": name,
    "in_blacklist": inBlacklist,
    "url": url,
    "gender": gender,
    "reg_time": regTime?.toIso8601String(),
    "uri": uri,
    "remark": remark,
    "avatar": avatar,
    "type": type,
    "id": id,
    "uid": uid,
  };
}

class Loc {
  Loc({
    this.id,
    this.name,
    this.uid,
  });

  String? id;
  String? name;
  String? uid;

  factory Loc.fromJson(Map<String, dynamic> json) => Loc(
    id: json["id"],
    name: json["name"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "uid": uid,
  };
}

class Cover {
  Cover({
    this.url,
    this.width,
    this.shape,
    this.height,
  });

  String? url;
  int? width;
  Shape? shape;
  int? height;

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
    url: json["url"],
    width: json["width"],
    shape: shapeValues.map[json["shape"]],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "shape": shapeValues.reverse?[shape],
    "height": height,
  };
}

enum Shape { RECTANGLE }

final shapeValues = EnumValues({
  "rectangle": Shape.RECTANGLE
});

enum NullRatingReason { EMPTY, NULL_RATING_REASON }

final nullRatingReasonValues = EnumValues({
  "": NullRatingReason.EMPTY,
  "暂无评分": NullRatingReason.NULL_RATING_REASON
});

class RatingData {
  RatingData({
    this.stats,
    this.typeRanks,
  });

  List<double>? stats;
  List<TypeRank>? typeRanks;

  factory RatingData.fromJson(Map<String, dynamic> json) => RatingData(
    stats: List<double>.from(json["stats"].map((x) => x.toDouble())),
    typeRanks: List<TypeRank>.from(json["type_ranks"].map((x) => TypeRank.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stats": List<dynamic>.from(stats!.map((x) => x)),
    "type_ranks": List<dynamic>.from(typeRanks!.map((x) => x.toJson())),
  };
}

class TypeRank {
  TypeRank({
    this.type,
    this.rank,
  });

  String? type;
  double? rank;

  factory TypeRank.fromJson(Map<String, dynamic> json) => TypeRank(
    type: json["type"],
    rank: json["rank"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "rank": rank,
  };
}

enum Type { MOVIE }

final typeValues = EnumValues({
  "movie": Type.MOVIE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
