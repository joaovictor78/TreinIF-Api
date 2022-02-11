import 'dart:convert';

import '/app/modules/start/submodules/workouts/data/dtos/team_dto.dart';

class ListTeamsDTO {
  List<TeamDTO>? teams;

  ListTeamsDTO({this.teams});

  ListTeamsDTO.fromMap(List<dynamic> list) {
    if (list != null) {
      teams = <TeamDTO>[];
      list.forEach((v) {
        teams!.add(new TeamDTO.fromMap(v));
      });
    }
  }

  factory ListTeamsDTO.fromJson(String source) => ListTeamsDTO.fromMap(json.decode(source));
}
