import '/app/modules/manage_individual_workout/data/dtos/exercises_dto.dart';

class ExercisesTypesDTO {
  List<ExerciseTypeDTO>? exercisesTypes;

  ExercisesTypesDTO({this.exercisesTypes});

  ExercisesTypesDTO.fromJson(Map<String, dynamic> json) {
    if (json['exercises_types'] != null) {
      exercisesTypes = <ExerciseTypeDTO>[];
      json['exercises_types'].forEach((v) {
        exercisesTypes!.add(new ExerciseTypeDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exercisesTypes != null) {
      data['exercises_types'] =
          this.exercisesTypes!.map((item) => item.toJson()).toList();
    }
    return data;
  }
}