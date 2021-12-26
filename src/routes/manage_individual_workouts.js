const route = require("express").Router();
const ManageIndividualWorkoutsController = require("../app/modules/workouts/manage_workouts/ManageIndividualWorkoutsController");
route.post('/individual', ManageIndividualWorkoutsController.createWorkout);
route.get('/individual', ManageIndividualWorkoutsController.getAllWorkouts);
module.exports = route;