module.exports = (sequelize, DataTypes) => {
    const ExercisesWorkout = sequelize.define('ExercisesWorkout', {
        series_number: DataTypes.INTEGER,
        repeat_time_in_seconds: DataTypes.INTEGER,
        exercise_variation: DataTypes.STRING
    },  {
        tableName: 'exercises_workout'
      });
    ExercisesWorkout.associate = function (models) {
        ExercisesWorkout.belongsToMany(models.DaysOfWeek, { foreignKey: 'day_of_week_id', through: 'exercises_days_of_week',  as: 'days_of_week'  });
        ExercisesWorkout.belongsTo(models.TeamWorkouts, { foreignKey: 'team_workout_id', as: 'team_workout' });
        ExercisesWorkout.belongsTo(models.IndividualWorkouts, { foreignKey: 'individual_workout_id', as: 'individual_workout' });
        ExercisesWorkout.belongsTo(models.ExerciseTypes, { foreignKey: 'exercise_type_id', as: 'exercise' });
    };
    return ExercisesWorkout;
}