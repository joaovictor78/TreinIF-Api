'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return await queryInterface.createTable('team_code', {
      id: {
        allowNull: false, 
        type: Sequelize.INTEGER,
        autoIncrement: true,
        primaryKey: true
      },
      code: {
        allowNull: false,
        type: Sequelize.STRING
      },
      team_id: {
        allowNull: false,
        type: Sequelize.INTEGER,
        references: {
           model: 'teams',
           key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      }

    });
  },

  down: async (queryInterface, Sequelize) => {
    return await queryInterface.dropTable('team_code');
  }
};
