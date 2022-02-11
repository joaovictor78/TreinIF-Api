import '/app/domain/entitities/athlete_entity.dart';
import '../../../../../../domain/entitities/course_entity.dart';
class AthleteDTO extends AthleteEntity{
  int? id;
  String? name;
  String? email;
  String? avatarUrl;
  String? birthdate;
  CourseEntity? course;
  String? bloodType;
  String? cpf;
  String? rg;

  AthleteDTO(
      {this.id,
      this.name,
      this.email,
      this.avatarUrl,
      this.course,
      this.birthdate,
      this.bloodType,
      this.cpf,
      this.rg}): super(id: id, name: name, email: email, avatarUrl: avatarUrl, cpf: cpf, rg: rg, birthdate: birthdate, bloodType: bloodType, course: course);

  AthleteDTO.fromJson(Map<String, dynamic> json) {
    id = json['athlete_id'];
    name = json['full_name'];
    email = json['email'];
    avatarUrl = json['avatar_url'];
    birthdate = json['birth_date'];
    bloodType = json['blood_type'];
    cpf = json['CPF'];
    rg = json['RG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['athlete_id'] = this.id;
    data['full_name'] = this.name;
    data['email'] = this.email;
    data['avatar_url'] = this.avatarUrl;
    data['birth_date'] = this.birthdate;
    data['blood_type'] = this.bloodType;
    data['CPF'] = this.cpf;
    data['RG'] = this.rg;
    return data;
  }
}