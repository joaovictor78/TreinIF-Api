import '/app/core/utils/return_data.dart';

abstract class IRemoveValueDataPointOfHistoricOfAthleteDataSource {
  Future<ReturnData> call(int athleteID, int dataPointID, int valueDataPointID);
}
