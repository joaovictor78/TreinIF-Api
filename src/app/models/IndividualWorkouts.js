module.exports = (sequelize, DataTypes) => {
    const IndividualWorkouts = sequelize.define('IndividualWorkouts', {
        name: DataTypes.STRING,
        is_active: DataTypes.BOOLEAN
    });
    IndividualWorkouts.associate = function (models) {
        IndividualWorkouts.belongsTo(models.AthleteData, { foreignKey: 'athlete_id', as: 'athlete' });
        IndividualWorkouts.belongsTo(models.User, { foreignKey: 'trainer_id', as: 'trainer' });
    };
    return IndividualWorkouts;
}