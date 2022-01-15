'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('athlete_team', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
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
     },
     
     athlete_id: {
      allowNull: false,
      type: Sequelize.INTEGER,
      references: {
        model: 'athlete_data',
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
    await queryInterface.dropTable('athlete_team');
  }
};
