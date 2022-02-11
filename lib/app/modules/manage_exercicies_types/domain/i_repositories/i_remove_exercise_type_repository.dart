import '/app/core/utils/return_data.dart';

abstract class IRemoveExerciseTypeRepository{
  Future<ReturnData> call(int id);
}