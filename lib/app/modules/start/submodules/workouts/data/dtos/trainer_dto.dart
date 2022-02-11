import 'package:treinif/app/modules/start/submodules/workouts/domain/entitities/trainer_entity.dart';

class TrainerDTO extends TrainerEntity {
  int? id;
  String? fullName;
  String? email;

  TrainerDTO({this.id, this.fullName, this.email});

  TrainerDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    return data;
  }
}
