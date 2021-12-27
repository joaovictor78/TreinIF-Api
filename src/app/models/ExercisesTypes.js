module.exports = (sequelize, DataTypes) => {
    const ExercisesTypes = sequelize.define('ExerciseTypes', {
        name: DataTypes.STRING,
    });
    ExercisesTypes.associate = function (models) {
        ExercisesTypes.belongsTo(models.Teams, { foreignKey: 'trainer_id', as: 'trainer' });
    };
    return ExercisesTypes;
}