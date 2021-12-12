const bcrypt = require("bcrypt");
module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define('User', {
        full_name: DataTypes.STRING(50),
        email: DataTypes.STRING(70),
        avatar_url: DataTypes.STRING(80),
        password: DataTypes.VIRTUAL,
        password_hash: DataTypes.STRING
    },
        {
            hooks: {
                beforeSave: async user => {
                    user.password_hash = await bcrypt.hash(user.password, 8);
                }
            }
        });
    User.associate = function (models) {
        User.belongsTo(models.Roles, { foreignKey: 'role_id', as: 'role' })
    };
    return User;
}
