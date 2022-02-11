import '/app/core/utils/return_data.dart';

abstract class IGetAllAthleteWorkoutsDataSource {
  Future<ReturnData> call(int athleteID);
}
