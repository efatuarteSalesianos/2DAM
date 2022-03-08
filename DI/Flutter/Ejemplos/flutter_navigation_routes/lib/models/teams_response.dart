class TeamsResponse {
  TeamsResponse({
    required this.league,
  });
  late final League league;

  TeamsResponse.fromJson(Map<String, dynamic> json) {
    league = League.fromJson(json['league']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['league'] = league.toJson();
    return _data;
  }
}

class League {
  League({
    required this.standard,
  });
  late final List<Standard> standard;

  League.fromJson(Map<String, dynamic> json) {
    standard =
        List.from(json['standard']).map((e) => Standard.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['standard'] = standard.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Standard {
  Standard({
    required this.city,
    required this.fullName,
    required this.isNBAFranchise,
    required this.confName,
    required this.tricode,
    required this.teamShortName,
    required this.divName,
    required this.isAllStar,
    required this.nickname,
    required this.urlName,
    required this.teamId,
    required this.altCityName,
  });
  late final String? city;
  late final String fullName;
  late final bool? isNBAFranchise;
  late final String? confName;
  late final String tricode;
  late final String? teamShortName;
  late final String? divName;
  late final bool? isAllStar;
  late final String? nickname;
  late final String? urlName;
  late final String? teamId;
  late final String? altCityName;

  Standard.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    fullName = json['fullName'];
    isNBAFranchise = json['isNBAFranchise'];
    confName = json['confName'];
    tricode = json['tricode'];
    teamShortName = json['teamShortName'];
    divName = json['divName'];
    isAllStar = json['isAllStar'];
    nickname = json['nickname'];
    urlName = json['urlName'];
    teamId = json['teamId'];
    altCityName = json['altCityName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city'] = city;
    _data['fullName'] = fullName;
    _data['isNBAFranchise'] = isNBAFranchise;
    _data['confName'] = confName;
    _data['tricode'] = tricode;
    _data['teamShortName'] = teamShortName;
    _data['divName'] = divName;
    _data['isAllStar'] = isAllStar;
    _data['nickname'] = nickname;
    _data['urlName'] = urlName;
    _data['teamId'] = teamId;
    _data['altCityName'] = altCityName;
    return _data;
  }
}
