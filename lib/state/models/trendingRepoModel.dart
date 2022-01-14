class TrendingRepo {
  int? rank;
  String? username;
  String? repositoryName;
  String? url;
  String? description;
  String? language;
  String? languageColor;
  int? totalStars;
  int? forks;
  int? starsSince;
  String? since;
  List<BuiltBy>? builtBy;

  TrendingRepo({
    this.rank,
    this.username,
    this.repositoryName,
    this.url,
    this.description,
    this.language,
    this.languageColor,
    this.totalStars,
    this.forks,
    this.starsSince,
    this.since,
    this.builtBy,
  });

  TrendingRepo.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    username = json['username'];
    repositoryName = json['repositoryName'];
    url = json['url'];
    description = json['description'];
    language = json['language'];
    languageColor = json['languageColor'];
    totalStars = json['totalStars'];
    forks = json['forks'];
    starsSince = json['StarsSince'];
    since = json['since'];
    if (json['builtBy'] != null) {
      builtBy = <BuiltBy>[];
      json['builtBy'].forEach((v) {
        builtBy?.add(new BuiltBy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    data['username'] = this.username;
    data['repositoryName'] = this.repositoryName;
    data['url'] = this.url;
    data['description'] = this.description;
    data['language'] = this.language;
    data['languageColor'] = this.languageColor;
    data['totalStars'] = this.totalStars;
    data['forks'] = this.forks;
    data['StarsSince'] = this.starsSince;
    data['since'] = this.since;
    if (this.builtBy != null) {
      data['builtBy'] = this.builtBy?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BuiltBy {
  String? username;
  String? url;
  String? avatar;

  BuiltBy({this.username, this.url, this.avatar});

  BuiltBy.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    url = json['url'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['url'] = this.url;
    data['avatar'] = this.avatar;
    return data;
  }
}
