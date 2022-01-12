const route = require("express").Router();
const ManageWorkoutsByTeamController = require("../app/modules/workouts/manage_workouts/ManageWorkoutsByTeamController");
route.post('/teams/workouts', ManageWorkoutsByTeamController.createWorkout);
route.get('/teams/:team_id/workouts', ManageWorkoutsByTeamController.getAllWorkoutsByTeam);
route.put('/teams/:team_id/workouts/:workout_id', ManageWorkoutsByTeamController.updateTrainingStatus);
module.exports = route;