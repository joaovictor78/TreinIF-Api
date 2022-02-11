import 'dart:convert';
import 'dart:developer';
import '/app/modules/start/submodules/workouts/data/dtos/code_dto.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/code_entitiy.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/team_entity.dart';

class TeamDTO extends TeamEntity {
  int? id;
  String? name;
  String? description;
  CodeEntity? code;
  ModalityEntity? modality;

  TeamDTO({this.id, this.name, this.description, this.modality, this.code}): super(id: id, name: name, description: description, code: code, modality: modality);


  factory TeamDTO.fromMap(Map<String, dynamic> map) {
    log(map.toString());
    return TeamDTO(
      id: map['id']?.toInt(),
      name: map['name'],
      description: map['description'],
      code: map["code"] != null ? CodeDTO.fromJson(map["code"]) : null,
      modality: map['modality'] != null ? ModalityEntity(name:  map['modality']['name']) : null,
    );
  }

  Map<String, dynamic> toJson(){
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data["name"] = this.name;
     data["description"] = this.description;
     data["code_id"] = this.code!.codeId;
     data["modality_id"] = this.modality!.id;
     return data;
  }

  factory TeamDTO.fromJson(String source) => TeamDTO.fromMap(json.decode(source));
}
