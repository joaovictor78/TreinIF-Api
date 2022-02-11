import '/app/core/utils/return_data.dart';

abstract class IAddExerciseTypeRepository{
  Future<ReturnData> call(String exerciseTypeName);
}