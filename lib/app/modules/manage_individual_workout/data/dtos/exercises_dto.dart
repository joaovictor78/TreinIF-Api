import '/app/domain/entitities/exercise_entity.dart';
import '/app/domain/entitities/exercise_type_entity.dart';

class ExercisesDTO {
  List<ExerciseDTO>? exercises;

  ExercisesDTO({this.exercises});

  ExercisesDTO.fromJson(Map<String, dynamic> json) {
    if (json['exercises'] != null) {
      exercises = <ExerciseDTO>[];
      json['exercises'].forEach((v) {
        exercises!.add(new ExerciseDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exercises != null) {
      data['exercises'] = this.exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExerciseDTO extends ExerciseEntity {
  int? id;
  int? seriesNumber;
  int? repeatTimeInSeconds;
  String? exerciseVariation;
  ExerciseTypeEntity? exerciseType;
  List<String>? daysOfWeek;

  ExerciseDTO(
      {this.id,
      this.seriesNumber,
      this.repeatTimeInSeconds,
      this.exerciseVariation,
      this.exerciseType,
      this.daysOfWeek}): super(id: id, seriesNumber: seriesNumber, exerciseType: exerciseType, exerciseVariation: exerciseVariation, repeatTimeInSeconds: repeatTimeInSeconds);

  ExerciseDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seriesNumber = json['series_number'];
    repeatTimeInSeconds = json['repeat_time_in_seconds'];
    exerciseVariation = json['exercise_variation'];
    exerciseType = json['exercise'] != null
        ? new ExerciseTypeDTO.fromJson(json['exercise'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['series_number'] = this.seriesNumber;
    data['repeat_time_in_seconds'] = this.repeatTimeInSeconds;
    data['exercise_variation'] = this.exerciseVariation;
    data['exercise_type_id'] = exerciseType!.id;
    data["days_of_week"] = this.daysOfWeek;
    return data;
  }
}

class ExerciseTypeDTO extends ExerciseTypeEntity{
  int? id;
  String? name;

  ExerciseTypeDTO({this.id, this.name}): super(id: id, name: name);

  ExerciseTypeDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}


