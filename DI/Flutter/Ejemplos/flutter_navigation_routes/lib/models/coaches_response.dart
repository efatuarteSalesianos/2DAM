class CoachesResponse {
  CoachesResponse({
    required this.league,
  });
  late final League league;

  CoachesResponse.fromJson(Map<String, dynamic> json) {
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
    required this.firstName,
    required this.lastName,
    required this.isAssistant,
    required this.personId,
    required this.teamId,
    required this.sortSequence,
    required this.college,
    required this.teamSitesOnly,
  });
  late final String firstName;
  late final String lastName;
  late final bool isAssistant;
  late final String personId;
  late final String teamId;
  late final String sortSequence;
  late final String college;
  late final TeamSitesOnly teamSitesOnly;

  Standard.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    isAssistant = json['isAssistant'];
    personId = json['personId'];
    teamId = json['teamId'];
    sortSequence = json['sortSequence'];
    college = json['college'];
    teamSitesOnly = TeamSitesOnly.fromJson(json['teamSitesOnly']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['isAssistant'] = isAssistant;
    _data['personId'] = personId;
    _data['teamId'] = teamId;
    _data['sortSequence'] = sortSequence;
    _data['college'] = college;
    _data['teamSitesOnly'] = teamSitesOnly.toJson();
    return _data;
  }
}

class TeamSitesOnly {
  TeamSitesOnly({
    required this.displayName,
    required this.coachCode,
    required this.coachRole,
    required this.teamCode,
    required this.teamTricode,
  });
  late final String displayName;
  late final String coachCode;
  late final String coachRole;
  late final String teamCode;
  late final String teamTricode;

  TeamSitesOnly.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    coachCode = json['coachCode'];
    coachRole = json['coachRole'];
    teamCode = json['teamCode'];
    teamTricode = json['teamTricode'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['displayName'] = displayName;
    _data['coachCode'] = coachCode;
    _data['coachRole'] = coachRole;
    _data['teamCode'] = teamCode;
    _data['teamTricode'] = teamTricode;
    return _data;
  }
}
