
import '/app/modules/start/submodules/workouts/domain/entitities/modality_entity.dart';

import '/app/modules/start/submodules/workouts/data/dtos/modality_dto.dart';

class ListModalitiesDTO {
  List<ModalityEntity>? modalities;

  ListModalitiesDTO({this.modalities});

  ListModalitiesDTO.fromJson(Map<String, dynamic> json) {
    if (json['modalities'] != null) {
      modalities = <ModalityDTO>[];
      json['modalities'].forEach((v) {
        modalities!.add(new ModalityDTO.fromJson(v));
      });
    }
  }
}

