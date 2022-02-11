import '/app/domain/entitities/course_entity.dart';

class CourseDTO extends CourseEntity {
  int? id;
  String? name;
  CourseDTO({this.id, this.name}) : super(id: id, name: name);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CourseDTO.fromMap(Map<String, dynamic> map) {
    return CourseDTO(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }
}
