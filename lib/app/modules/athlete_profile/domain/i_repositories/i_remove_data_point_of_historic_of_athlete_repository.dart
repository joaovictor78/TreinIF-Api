import '/app/core/utils/return_data.dart';

abstract class IRemoveDataPointOfHistoricOfAthleteRepository{
  Future<ReturnData> call(int athleteID, int dataPointID);
}