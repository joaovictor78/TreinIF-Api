import '/app/domain/entitities/course_entity.dart';

class AthleteEntity {
  int? id;
  String? avatarUrl;
  String? name;
  String? email;
  String? cpf;
  String? rg;
  CourseEntity? course;
  String? bloodType;
  String? birthdate; 
  AthleteEntity({this.id, this.name,this.email, this.birthdate, this.bloodType, this.avatarUrl,  this.course, this.rg, this.cpf});
}

