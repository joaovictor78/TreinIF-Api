const route = require("express").Router();
const AthletesController = require("../app/modules/athletes/AthletesController");
route.post('/athletes', AthletesController.registerSupplementaryData);
route.get('/athletes', AthletesController.getAllAthletesWithFilter);
route.get('/athletes/by-individual-workouts', AthletesController.getAllAthletesByIndividualWorkouts);
module.exports = route;