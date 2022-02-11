import '/app/core/utils/return_data.dart';

abstract class IRemoveExerciseDataSource {
  Future<ReturnData> call();
}
