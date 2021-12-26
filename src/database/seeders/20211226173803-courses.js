'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
   return await queryInterface.bulkInsert('courses', [
      {
        name: 'Tec. em Informática'
      },
      {
        name: 'Tec. em Eletrotecnica'
      },
      {
        name: 'Tec. em Edificações'
      },
      {
        name: 'Tec. em Quimica'
      },

    ], {});

  },

  down: async (queryInterface, Sequelize) => {
     return await queryInterface.bulkDelete('courses', null, {});
  }
};
