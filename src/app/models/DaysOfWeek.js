module.exports = (sequelize, DataTypes) => {
    const DaysOfWeek = sequelize.define('DaysOfWeek', {
        day_of_week: DataTypes.STRING,
    }, 
    {
        tableName: 'days_of_week'
      });
    DaysOfWeek.associate = function (models) {
        DaysOfWeek.belongsToMany(models.ExercisesWorkout, { foreignKey: 'exercise_id', through: 'exercises_days_of_week', as: 'exercises', });
    }
    return DaysOfWeek;
}

