module.exports = (sequelize, DataTypes) => {
    const TeamCode = sequelize.define('TeamCode', {
        code: DataTypes.STRING,
    },
    {
        tableName: 'team_code'
    });
    TeamCode.associate = function(models) {
        TeamCode.belongsTo(models.Teams, {foreignKey: 'team_id', as: 'team'})
      };
    return TeamCode;
}


