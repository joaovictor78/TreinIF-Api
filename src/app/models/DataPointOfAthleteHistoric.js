module.exports = (sequelize, DataTypes) => {
    const DataPointOfAthleteHistoric = sequelize.define('DataPointOfAthleteHistoric',
        {
            tableName: 'data_point_of_athlete_historic'
        });
    DataPointOfAthleteHistoric.associate = function (models) {
        DataPointOfAthleteHistoric.hasMany(models.ValueDataPointOfAthleteHistoric, { foreignKey: 'data_point_id', as: 'values_data_point', });
    }
    return DataPointOfAthleteHistoric;
}
