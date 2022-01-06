const route = require("express").Router();
const TeamsController = require("../app/modules/teams/TeamsController");
const permissions = require("../app/middlewares/auth_service"); 
route.post("/teams/generate-code", permissions.isTrainer,  TeamsController.generateTeamCode);
route.post("/teams", permissions.isTrainer, TeamsController.createTeam);
route.get("/teams", TeamsController.getTeams);
route.get("/teams/workouts", TeamsController.getTeamsByWorkouts);

module.exports = route;