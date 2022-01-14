const route = require("express").Router();
const ManageExercisesController = require("../app/modules/workouts/manage_exercicies/ManageExercisesController");
route.post('/workouts/:id/exercises', ManageExercisesController.createExercise);
route.get('/workouts/:id/exercises', ManageExercisesController.getExercisesByDayOfWeek);
module.exports = route;