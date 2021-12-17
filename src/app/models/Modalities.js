module.exports = (sequelize, DataTypes) => {
    const Modalities = sequelize.define('Modalities', {
        name: DataTypes.STRING
    });
    return Modalities;
}