class PlayerResponse {
  PlayerResponse({
    required this.league,
  });
  late final League league;

  PlayerResponse.fromJson(Map<String?, dynamic> json) {
    league = League.fromJson(json['league']);
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['league'] = league.toJson();
    return _data;
  }
}

class League {
  League({
    required this.standard,
  });
  late final List<Standard> standard;

  League.fromJson(Map<String?, dynamic> json) {
    standard =
        List.from(json['standard']).map((e) => Standard.fromJson(e)).toList();
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['standard'] = standard.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Standard {
  Standard({
    required this.firstName,
    required this.lastName,
    required this.temporaryDisplayName,
    required this.personId,
    required this.teamId,
    required this.jersey,
    required this.isActive,
    required this.pos,
    required this.heightFeet,
    required this.heightInches,
    required this.heightMeters,
    required this.weightPounds,
    required this.weightKilograms,
    required this.dateOfBirthUTC,
    required this.teamSitesOnly,
    required this.teams,
    required this.draft,
    required this.nbaDebutYear,
    required this.yearsPro,
    required this.collegeName,
    required this.lastAffiliation,
    required this.country,
  });
  late final String? firstName;
  late final String? lastName;
  late final String? temporaryDisplayName;
  late final String? personId;
  late final String? teamId;
  late final String? jersey;
  late final bool? isActive;
  late final String? pos;
  late final String? heightFeet;
  late final String? heightInches;
  late final String? heightMeters;
  late final String? weightPounds;
  late final String? weightKilograms;
  late final String? dateOfBirthUTC;
  late final TeamSitesOnly? teamSitesOnly;
  late final List<Teams>? teams;
  late final Draft? draft;
  late final String? nbaDebutYear;
  late final String? yearsPro;
  late final String? collegeName;
  late final String? lastAffiliation;
  late final String? country;

  Standard.fromJson(Map<String?, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    temporaryDisplayName = json['temporaryDisplayName'];
    personId = json['personId'];
    teamId = json['teamId'];
    jersey = json['jersey'];
    isActive = json['isActive'];
    pos = json['pos'];
    heightFeet = json['heightFeet'];
    heightInches = json['heightInches'];
    heightMeters = json['heightMeters'];
    weightPounds = json['weightPounds'];
    weightKilograms = json['weightKilograms'];
    dateOfBirthUTC = json['dateOfBirthUTC'];
    teamSitesOnly = TeamSitesOnly.fromJson(json['teamSitesOnly']);
    teams = List.from(json['teams']).map((e) => Teams.fromJson(e)).toList();
    draft = Draft.fromJson(json['draft']);
    nbaDebutYear = json['nbaDebutYear'];
    yearsPro = json['yearsPro'];
    collegeName = json['collegeName'];
    lastAffiliation = json['lastAffiliation'];
    country = json['country'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['temporaryDisplayName'] = temporaryDisplayName;
    _data['personId'] = personId;
    _data['teamId'] = teamId;
    _data['jersey'] = jersey;
    _data['isActive'] = isActive;
    _data['pos'] = pos;
    _data['heightFeet'] = heightFeet;
    _data['heightInches'] = heightInches;
    _data['heightMeters'] = heightMeters;
    _data['weightPounds'] = weightPounds;
    _data['weightKilograms'] = weightKilograms;
    _data['dateOfBirthUTC'] = dateOfBirthUTC;
    _data['teamSitesOnly'] = teamSitesOnly?.toJson();
    _data['teams'] = teams?.map((e) => e.toJson()).toList();
    _data['draft'] = draft?.toJson();
    _data['nbaDebutYear'] = nbaDebutYear;
    _data['yearsPro'] = yearsPro;
    _data['collegeName'] = collegeName;
    _data['lastAffiliation'] = lastAffiliation;
    _data['country'] = country;
    return _data;
  }
}

class TeamSitesOnly {
  TeamSitesOnly({
    required this.playerCode,
    required this.posFull,
    required this.displayAffiliation,
    required this.freeAgentCode,
  });
  late final String? playerCode;
  late final String? posFull;
  late final String? displayAffiliation;
  late final String? freeAgentCode;

  TeamSitesOnly.fromJson(Map<String?, dynamic> json) {
    playerCode = json['playerCode'];
    posFull = json['posFull'];
    displayAffiliation = json['displayAffiliation'];
    freeAgentCode = json['freeAgentCode'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['playerCode'] = playerCode;
    _data['posFull'] = posFull;
    _data['displayAffiliation'] = displayAffiliation;
    _data['freeAgentCode'] = freeAgentCode;
    return _data;
  }
}

class Teams {
  Teams({
    required this.teamId,
    required this.seasonStart,
    required this.seasonEnd,
  });
  late final String? teamId;
  late final String? seasonStart;
  late final String? seasonEnd;

  Teams.fromJson(Map<String?, dynamic> json) {
    teamId = json['teamId'];
    seasonStart = json['seasonStart'];
    seasonEnd = json['seasonEnd'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['teamId'] = teamId;
    _data['seasonStart'] = seasonStart;
    _data['seasonEnd'] = seasonEnd;
    return _data;
  }
}

class Draft {
  Draft({
    required this.teamId,
    required this.pickNum,
    required this.roundNum,
    required this.seasonYear,
  });
  late final String? teamId;
  late final String? pickNum;
  late final String? roundNum;
  late final String? seasonYear;

  Draft.fromJson(Map<String?, dynamic> json) {
    teamId = json['teamId'];
    pickNum = json['pickNum'];
    roundNum = json['roundNum'];
    seasonYear = json['seasonYear'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['teamId'] = teamId;
    _data['pickNum'] = pickNum;
    _data['roundNum'] = roundNum;
    _data['seasonYear'] = seasonYear;
    return _data;
  }
}
