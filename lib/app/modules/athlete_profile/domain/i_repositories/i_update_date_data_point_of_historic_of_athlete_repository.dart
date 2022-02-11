import '/app/core/utils/return_data.dart';

abstract class IUpdateDateDataPointOfHistoricOfAthleteRepository{
  Future<ReturnData> call(int athleteID, int dataPointID, String date);
}