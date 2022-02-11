import '/app/core/utils/return_data.dart';

abstract class IGetExercisesTypesDataSource{
   Future<ReturnData> call();
}