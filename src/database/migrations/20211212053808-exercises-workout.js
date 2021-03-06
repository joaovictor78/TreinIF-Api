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
      team_workout_id: {
        allowNull: true,
        type: Sequelize.INTEGER,
        references: {
          model: 'team_workouts',
          key: 'id'
        },
        onUpdate: 'CASCADE',
        onDelete: 'CASCADE'
      },
      individual_workout_id: {
        allowNull: true,
        type: Sequelize.INTEGER,
        references: {
          model: 'individual_workouts',
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
