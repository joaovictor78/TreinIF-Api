const route = require("express").Router();
const ManageExercisesController = require("../app/modules/workouts/manage_exercicies/ManageExercisesController");
route.post('/workouts/:id/exercises', ManageExercisesController.createExercise);
route.get('/workouts/:id/exercises', ManageExercisesController.getExercisesByDayOfWeek);
route.get('/athletes/:id/individual-workout/exercises', ManageExercisesController.getIndividualExercisesByDayOfWeekAsAthlete);
route.get('/team-workout/:id/exercises', ManageExercisesController.getTeamExercisesByDayOfWeekAsAthlete);
route.delete('/workouts/:id/exercises/:id', ManageExercisesController.removeExercise);
module.exports = route;