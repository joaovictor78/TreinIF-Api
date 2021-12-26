'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {

    await queryInterface.bulkInsert('roles', [
      {
        role: 'athlete'
      },
      {
        role: 'trainer'
      },
      {
        role: 'admin'
      }
    ], {});

  },

  down: async (queryInterface, Sequelize) => {
      await queryInterface.bulkDelete('roles', null, {});
  }
};
