module.exports = (sequelize, DataTypes) => {
    const IndividualWorkouts = sequelize.define('IndividualWorkouts', {
        name: DataTypes.STRING,
        is_active: DataTypes.BOOLEAN
    });
    IndividualWorkouts.associate = function (models) {
        IndividualWorkouts.belongsTo(models.User, { foreignKey: 'athlete_id', as: 'athletes' });
        IndividualWorkouts.belongsTo(models.Teams, { foreignKey: 'trainer_id', as: 'trainer' });
    };
    return IndividualWorkouts;
}