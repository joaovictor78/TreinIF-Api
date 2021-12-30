const route = require("express").Router();
const ManageIndividualWorkoutsController = require("../app/modules/workouts/manage_workouts/ManageIndividualWorkoutsController");
route.post('/individual/workouts', ManageIndividualWorkoutsController.createWorkout);
route.get('/individual/workouts', ManageIndividualWorkoutsController.getAllWorkouts);
module.exports = route;