enum UserTypesEnum{
  athlete, trainer
}
extension UserTypesExtension on UserTypesEnum{
  static const values = [1, 2, 3];
  int get code => values[index];
}