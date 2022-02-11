import '/app/core/utils/return_data.dart';

abstract class IGetExercisesTypeDataSource{
  Future<ReturnData> call();
}