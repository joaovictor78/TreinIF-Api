import '/app/core/utils/return_data.dart';

abstract class IUpdateExerciseTypeRepository{
  Future<ReturnData> call(int id, String exerciseTypeName);
}