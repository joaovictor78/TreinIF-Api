import '/app/core/utils/return_data.dart';

abstract class IUpdateExerciseTypeDataSource{
  Future<ReturnData> call(int id, String exerciseTypeName);
}