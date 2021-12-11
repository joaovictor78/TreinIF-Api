module.exports = (sequelize, DataTypes) => {
    const Courses = sequelize.define('Courses', {
        name: DataTypes.INTEGER
    });
    return Courses;
}