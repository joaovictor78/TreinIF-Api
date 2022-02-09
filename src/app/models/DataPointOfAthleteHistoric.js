module.exports = (sequelize, DataTypes) => {
    const DataPointOfAthleteHistoric = sequelize.define('DataPointOfAthleteHistoric',
    {
      
    },
        {
            tableName: 'data_point_of_athlete_historic'
        });
    DataPointOfAthleteHistoric.associate = function (models) {
        DataPointOfAthleteHistoric.belongsTo(models.AthleteData, {foreignKey: 'athlete_id', as: 'athlete'});
        DataPointOfAthleteHistoric.belongsTo(models.User, {foreignKey: 'trainer_id', as: 'trainer'});
        DataPointOfAthleteHistoric.hasMany(models.ValueDataPointOfAthleteHistoric, { foreignKey: 'data_point_id', as: 'values_data_point', });
    }
    return DataPointOfAthleteHistoric;
}
