'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return await queryInterface.createTable('days_of_week', {
      id: {
        allowNull: false,
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
      },
      day_of_week: {
        allowNull: false,
        unique: true,
        type: Sequelize.ENUM("Sunday", "Monday", "Tuesday", "Wednersday", "Thursday", "Friday", "Saturday")
      }
    });
  },

  down: async (queryInterface, Sequelize) => {
    return await queryInterface.dropTable('days_of_week');
  }
};
