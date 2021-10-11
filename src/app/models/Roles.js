module.exports = (sequelize, DataTypes) => {
    const Roles = sequelize.define('Roles', {
        user_id: DataTypes.INTEGER,
        role: DataTypes.ENUM('admin', 'broker')
    });
    return Roles;
}