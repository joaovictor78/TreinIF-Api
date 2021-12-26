module.exports = (sequelize, DataTypes) => {
    const TeamWorkouts = sequelize.define('TeamWorkouts', {
        name: DataTypes.STRING,
        is_active: DataTypes.BOOLEAN
    });
    TeamWorkouts.associate = function (models) {
        TeamWorkouts.belongsTo(models.User, { foreignKey: 'athlete_id', as: 'athletes' });
        TeamWorkouts.belongsTo(models.Teams, { foreignKey: 'team_id', as: 'team' });
    };
    return TeamWorkouts;
}