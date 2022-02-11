import 'athlete_dto.dart';

class ListAthletesDTO {
  List<AthleteDTO>? athletes;

  ListAthletesDTO({this.athletes});

  ListAthletesDTO.fromJson(Map<String, dynamic> json) {
    if (json['athletes'] != null) {
      athletes = <AthleteDTO>[];
      json['athletes'].forEach((v) {
        athletes!.add(new AthleteDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.athletes != null) {
      data['athletes'] = this.athletes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}