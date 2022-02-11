enum ExerciseClassificationEnum{
  individual, team
}
extension ExerciseClassificationExtension on ExerciseClassificationEnum{
  static const values = [0, 1];
  int get value => values[index];
}