import '/app/modules/athlete_profile/domain/entities/value_data_point_of_athlete_historic_entity.dart';

class DataPointOfAthleteHistoricEntity{
  int? id;
  String? date;
  List<ValueDataPointOfAthleteHistoricEntity>? values;
  DataPointOfAthleteHistoricEntity({
    this.id,
    this.date,
    this.values
  });
}