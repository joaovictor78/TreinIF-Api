module.exports = (sequelize, DataTypes) => {
    const RefreshToken = sequelize.define('RefreshToken', {
        user_id: DataTypes.INTEGER,
        refresh_token: DataTypes.STRING,
        expire_in: DataTypes.INTEGER
    }, {
        tableName: 'refresh_token'
    });
    return RefreshToken;
}