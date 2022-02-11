import '/app/core/utils/return_data.dart';

abstract class IAddExerciseTypeDataSource{
  Future<ReturnData> call(String exerciseTypeName);
}