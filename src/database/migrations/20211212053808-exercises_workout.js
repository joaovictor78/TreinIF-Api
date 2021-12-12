'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return await queryInterface.createTable('exercises_workout', {
      id: {
        type: Sequelize.INTEGER,
        allowNull: false, 
        primaryKey: true, 
        autoIncrement: true
      },
      workout_id: {
        allowNull: false,
        type: Sequelize.INTEGER,
        references: {
          model: 'workouts',
          key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      },
      exercise_type_id:{
        allowNull: false,
        type: Sequelize.INTEGER,
        references: {
          model: 'exercise_types',
          key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      },
      day_of_week:{
        type: Sequelize.DATE,
        allowNull: false
      },
      series_number:{
        type: Sequelize.INTEGER,
        allowNull: false
      },
      repeat_time_in_seconds: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      exercise_variation: {
        type: Sequelize.STRING,
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
    return await queryInterface.dropTable('exercises_workout');
  }
};
