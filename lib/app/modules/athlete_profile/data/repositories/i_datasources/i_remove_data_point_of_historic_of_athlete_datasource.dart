import '/app/core/utils/return_data.dart';

abstract class IRemoveDataPointOfHistoricOfAthleteDataSource{
  Future<ReturnData> call(int athleteID, int dataPointID);
}