const route = require("express").Router();
const ExercisesTypesController = require("../app/modules/trainers/manage_exercises_types/ManageExercisesTypesController");
route.post('/exercises-types', ExercisesTypesController.createExerciseType);
route.get('/exercises-types', ExercisesTypesController.getExercisesTypes);
route.put('/exercises-types/:id', ExercisesTypesController.updateExerciseType);
route.delete('/exercises-types/:id', ExercisesTypesController.removeExerciseType);

module.exports = route;