'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    return await queryInterface.createTable('refresh_token', {
      id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
      },
      user_id: {
        type: Sequelize.INTEGER,
        allowNull: false, 
        references: {
          model: 'users',
          key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'

      },
      refresh_token: {
       type: Sequelize.STRING,
       allowNull: false, 
      },
      expire_in: {
        type: Sequelize.INTEGER,
        allowNull: false
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
   
     return await queryInterface.dropTable('refresh_token');

  }
};
