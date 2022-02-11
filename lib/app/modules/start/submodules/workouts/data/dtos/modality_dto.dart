
import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';

class ModalityDTO extends ModalityEntity{
  int? id;
  String? name;

  ModalityDTO({this.id, this.name});

  ModalityDTO.fromJson(Map<String, dynamic> json) {
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