const route = require("express").Router();
const ExercisesTypesController = require("../app/modules/trainers/manage_exercises_types/ManageExercisesTypesController");
route.post('/exercises-types', ExercisesTypesController.createExerciseType);
route.get('/exercises-types', ExercisesTypesController.getExercisesTypes)

module.exports = route;