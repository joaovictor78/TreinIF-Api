const route = require("express").Router();
const AthletesController = require("../app/modules/athletes/AthletesController");
route.post('/athletes', AthletesController.registerSupplementaryData);
route.put('/athletes', AthletesController.updateSupplementaryData);
route.post('/athletes/:id/historic', AthletesController.addDataPointOfAthlete);
route.post('/athletes/:id/historic/data-point/:data_point_id', AthletesController.addValueOfDataPointOfAthlete);
route.get('/athletes', AthletesController.getAllAthletesWithFilter);
route.get('/athletes/by-individual-workouts', AthletesController.getAllAthletesByIndividualWorkouts);
route.get('/athletes/:id/historic', AthletesController.getHistoricOfAthlete);
route.put('/athletes/:id/historic/data-point/:data_point_id', AthletesController.updateValueOfDataPointOfAthlete);
route.delete('/athletes/:id/historic/:historic_id', AthletesController.removeDataPointOfAthlete);

module.exports = route;