import '/app/domain/entitities/individual_workout_entity.dart';

class IndividualWorkoutsDTO {
  int? size;
  List<Workouts>? workouts;

  IndividualWorkoutsDTO({this.size, this.workouts});

  IndividualWorkoutsDTO.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    if (json['workouts'] != null) {
      workouts = <Workouts>[];
      json['workouts'].forEach((v) {
        workouts!.add(new Workouts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    if (this.workouts != null) {
      data['workouts'] = this.workouts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Workouts extends IndividualWorkoutEntity{
  int? id;
  String? name;
  bool? isActive;
  int? athleteId;
  int? trainerId;

  Workouts(
      {this.id,
      this.name,
      this.isActive,
      this.athleteId,
      this.trainerId}):super(id: id, name: name, isActive: isActive);

  Workouts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['athlete_id'] = this.athleteId;
    return data;
  }
}