module.exports = (sequelize, DataTypes) => {
    const Roles = sequelize.define('Roles', {
        role: DataTypes.ENUM('admin', 'broker')
    });
    return Roles;
}