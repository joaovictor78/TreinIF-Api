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
        type: Sequelize.INTEGER,
        allowNull: true,
        references: {
           model: 'teams',
           key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      },
      created_at: {
        type: Sequelize.DATE,
        allowNull: false
      },
      updated_at: {
        type: Sequelize.DATE,
        allowNull: false
      }

    });
  },

  down: async (queryInterface, Sequelize) => {
    return await queryInterface.dropTable('team_code');
  }
};
