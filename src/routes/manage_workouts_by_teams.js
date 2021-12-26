const route = require("express").Router();
const ManageWorkoutsByTeamController = require("../app/modules/workouts/manage_workouts/ManageWorkoutsByTeamController");
route.post('/team', ManageWorkoutsByTeamController.createWorkout);
route.get('/team', ManageWorkoutsByTeamController.getAllWorkouts);
module.exports = route;