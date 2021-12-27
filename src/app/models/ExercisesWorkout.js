module.exports = (sequelize, DataTypes) => {
    const ExercisesWorkout = sequelize.define('ExercisesWorkout', {
        day_of_week: DataTypes.DATE,
        series_number: DataTypes.INTEGER,
        repeat_time_in_seconds: DataTypes.INTEGER,
        exercise_variation: DataTypes.STRING
    });
    ExercisesWorkout.associate = function (models) {
        ExercisesWorkout.belongsTo(models.TeamWorkouts, { foreignKey: 'team_workout_id', as: 'team_workout' });
        ExercisesWorkout.belongsTo(models.IndividualWorkouts, { foreignKey: 'individual_workout_id', as: 'individual_workout' });
        ExercisesWorkout.belongsTo(models.ExerciseTypes, { foreignKey: 'exercise_type_id', as: 'exercise_type' });
    };
    return ExercisesWorkout;
}