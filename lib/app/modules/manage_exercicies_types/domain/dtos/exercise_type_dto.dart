import '/app/domain/entitities/exercise_type_entity.dart';

class ExerciseType implements ExerciseTypeEntity{
  int? id;
  String? name;

  ExerciseType({this.id, this.name});

  ExerciseType.fromJson(Map<String, dynamic> json) {
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