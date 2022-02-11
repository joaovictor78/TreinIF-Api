import '/app/core/utils/return_data.dart';

abstract class IGetAllIndividualWorkoutsRepository {
  Future<ReturnData> call(int athleteID);
}