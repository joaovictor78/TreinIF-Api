const route = require("express").Router();
const ManageIndividualWorkoutsController = require("../app/modules/workouts/manage_workouts/ManageIndividualWorkoutsController");
route.post('/individual/workouts', ManageIndividualWorkoutsController.createWorkout);
route.get('/individual/workouts', ManageIndividualWorkoutsController.getAllWorkouts);
route.update('/individual/workouts/:workout_id', ManageIndividualWorkoutsController.updateTrainingStatus);
module.exports = route;