module.exports = (sequelize, DataTypes) => {
    const Teams = sequelize.define('Teams', {
        name: DataTypes.STRING,
        description: DataTypes.STRING,
        code: DataTypes.STRING
    });
    Team.associate = function(models) {
        Team.belongsTo(models.User, {foreignKey: 'id', as: 'trainerId'});
        Team.belongsTo(models.Modalities, {foreignKey: 'id', as: 'modalitiesId'})
      };
    return Teams;
}