import '/app/modules/start/submodules/workouts/domain/entitities/code_entitiy.dart';
import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';

class TeamEntity {
  int? id; 
  String? name;
  String? description;
  CodeEntity? code;
  ModalityEntity? modality; 
  TeamEntity({
     this.id,
     this.name,
     this.description,
     this.code,
     this.modality
  });
}
