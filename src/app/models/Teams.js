module.exports = (sequelize, DataTypes) => {
    const Teams = sequelize.define('Teams', {
        name: DataTypes.STRING,
        description: DataTypes.STRING
    });
    Teams.associate = function(models) {
        Teams.belongsToMany(models.AthleteData, { foreignKey: 'athlete_id',  through: 'athlete_team', as: 'athletes', });
        Teams.hasOne(models.TeamCode, {foreignKey: 'team_id', as: 'code'});
        Teams.belongsTo(models.User, {foreignKey: 'trainer_id', as: 'trainer'});
        Teams.belongsTo(models.Modalities, {foreignKey: 'modality_id', as: 'modality'})
      };
    return Teams;
}