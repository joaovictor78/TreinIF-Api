'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {

    return await queryInterface.createTable('athelete_data', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      birth_date:{
        allowNull: false,
        type: Sequelize.DATE  
      },
      blood_type: {
        allowNull: false,
        type: Sequelize.ENUM("A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O")
      },
      CPF:{
        allowNull: false,
        type: Sequelize.STRING
      },
      RG: {
        allowNull: false,
        type: Sequelize.STRING
      },

      user_id:{
        allowNull: false,
        type: Sequelize.INTEGER,
        references: {
          model: 'users',
          key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      },
      course_id: {
        allowNull: false,
        type: Sequelize.INTEGER,
        references: {
          model: 'courses',
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
     return await queryInterface.dropTable('athelete_data');  
  }
};
