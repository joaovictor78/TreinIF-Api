module.exports = (sequelize, DataTypes) => {
    const PasswordResetToken = sequelize.define('PasswordResetToken', {
        user_id: DataTypes.INTEGER,
        password_reset_token: DataTypes.STRING,
        expire_in: DataTypes.INTEGER
    }, {
        tableName: 'password_reset_token'
    });
    return PasswordResetToken;
}