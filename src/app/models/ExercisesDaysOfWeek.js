
module.exports = (sequelize, DataTypes) => {
    const ExercisesDaysOfWeek = sequelize.define('ExercisesDaysOfWeek', {});
    ExercisesDaysOfWeek.associate = function (models) {
        ExercisesDaysOfWeek.belongsTo(models.ExercisesWorkout, { foreignKey: 'exercise_id', as: 'exercise' });
        ExercisesDaysOfWeek.belongsToMany(models.DaysOfWeek, { foreignKey: 'day_of_week_ud', as: 'day_of_week' });
    };
    return ExercisesDaysOfWeek;
}