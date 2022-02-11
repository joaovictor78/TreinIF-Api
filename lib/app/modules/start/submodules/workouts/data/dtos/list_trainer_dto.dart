import '/app/modules/start/submodules/workouts/data/dtos/trainer_dto.dart';

class ListTrainersDTO {
  List<TrainerDTO>? teams;

  ListTrainersDTO({this.teams});

  ListTrainersDTO.fromMap(List<dynamic> list) {
    if (list != null) {
      teams = <TrainerDTO>[];
      for (var v in list) {
        teams!.add(TrainerDTO.fromJson(v));
      }
    }
  }
}
