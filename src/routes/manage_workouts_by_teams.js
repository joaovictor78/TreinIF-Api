const route = require("express").Router();
const ManageWorkoutsByTeamController = require("../app/modules/workouts/manage_workouts/ManageWorkoutsByTeamController");
route.post('/teams/:team_id/workouts', ManageWorkoutsByTeamController.createWorkout);
route.get('/teams/:team_id/workouts', ManageWorkoutsByTeamController.getAllWorkoutsByTeam);
route.get('/teams/:team_id/all-athletes', ManageWorkoutsByTeamController.getAllAthletesOfTeam)
route.put('/teams/:team_id/workouts/:workout_id/status', ManageWorkoutsByTeamController.updateTrainingStatus);
route.put('/teams/:team_id/workouts/:workout_id', ManageWorkoutsByTeamController.updateWorkoutName);
route.delete('/teams/:team_id/workouts/:workout_id', ManageWorkoutsByTeamController.removeWorkout);

module.exports = route;