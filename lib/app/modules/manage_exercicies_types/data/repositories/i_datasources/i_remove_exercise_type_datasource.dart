import '/app/core/utils/return_data.dart';

abstract class IRemoveExerciseTypeDataSource{
  Future<ReturnData> call(int id);
}