const route = require("express").Router();
const ManageIndividualWorkoutsController = require("../app/modules/workouts/manage_workouts/ManageIndividualWorkoutsController");
route.post('/individual/workouts', ManageIndividualWorkoutsController.createWorkout);
route.get('/athletes/:id/individual/workouts', ManageIndividualWorkoutsController.getAllWorkouts);
route.put('/athletes/:id/individual/workouts/:workout_id/activate', ManageIndividualWorkoutsController.updateTrainingStatus);
route.put('/individual/workouts/:id', ManageIndividualWorkoutsController.updateWorkoutName);
route.delete('/individual/workouts/:id', ManageIndividualWorkoutsController.removeWorkout);
module.exports = route;