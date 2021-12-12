const route = require("express").Router();
const AthletesController = require("../app/modules/athletes/AthletesController");
route.post('/athlete', AthletesController.registerSupplementaryData);

module.exports = route;