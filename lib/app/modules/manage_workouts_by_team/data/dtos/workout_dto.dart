import 'dart:convert';

import '/app/domain/entitities/workout_entity.dart';

class WorkoutDTO extends WorkoutEntity {
  int? id;
  String? name;
  bool? isActive;
  WorkoutDTO({this.id, this.name, this.isActive}) : super(id: id, name: name, isActive: isActive);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isActive': isActive,
    };
  }

  factory WorkoutDTO.fromMap(Map<String, dynamic> map) {
    return WorkoutDTO(
      id: map['id']?.toInt(),
      name: map['name'],
      isActive: map['isActive'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkoutDTO.fromJson(String source) => WorkoutDTO.fromMap(json.decode(source));
}
