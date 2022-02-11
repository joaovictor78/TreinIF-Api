import '/app/core/utils/return_data.dart';

abstract class IRemoveValueDataPointOfHistoricOfAthleteUseCase{
  Future<ReturnData> call(int athleteID, int dataPointID,  int valueDataPointID);
}