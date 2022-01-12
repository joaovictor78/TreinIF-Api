module.exports = (sequelize, DataTypes) => {
    const ValueDataPointOfAthleteHistoric = sequelize.define('ValueDataPointOfAthleteHistoric', 
    {
        type: DataTypes.STRING,
        value: DataTypes.STRING
    },
        {
            tableName: 'value_data_point_of_athlete_historic'
        });
    ValueDataPointOfAthleteHistoric.associate = function (models) {
    ValueDataPointOfAthleteHistoric.belongsTo(models.DataPointOfAthleteHistoric, { foreignKey: 'data_point_id', as: 'data_point', });
    }
    return ValueDataPointOfAthleteHistoric;
}
