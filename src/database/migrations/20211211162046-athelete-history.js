'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {

    await queryInterface.createTable('athlete_history', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      measurement_date: {
        allowNull: false,
        type: Sequelize.DATE
      },
      pressure: {
        allowNull: false,
        type: Sequelize.FLOAT
      },
      weight: {
        allowNull: false,
        type: Sequelize.FLOAT
      },
      heigth: {
        allowNull: false,
        type: Sequelize.FLOAT
      },
      user_id: {
        allowNull: false,
        type: Sequelize.INTEGER,
        references: {
          model: 'users',
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
    await queryInterface.dropTable('athlete_history');
  }
};
