module.exports = (sequelize, DataTypes) => {
    const AthleteData = sequelize.define("AthleteData", {
        birth_date: DataTypes.DATE,
        blood_type: DataTypes.ENUM("A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O"),
        CPF:  {
            type: DataTypes.STRING,
        underscored: false,
        field: 'CPF'},
        RG:{
            type: DataTypes.STRING,
        underscored: false,
        field: 'RG'}
    });
    AthleteData.associate = function (models) {
        AthleteData.hasMany(models.DataPointOfAthleteHistoric, {foreignKey: 'athlete_id', as: 'athlete'});
        AthleteData.belongsToMany(models.Teams, { foreignKey: 'team_id',  through: 'athlete_team', as: 'team', });
        AthleteData.belongsTo(models.User, { foreignKey: 'user_id', as: 'users' });
        AthleteData.belongsTo(models.Courses, { foreignKey: 'course_id', as: 'course' });
    };
    return AthleteData;
}
