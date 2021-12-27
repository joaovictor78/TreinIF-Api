const route = require("express").Router();
const TeamsController = require("../app/modules/teams/TeamsController");
const permissions = require("../app/services/auth_service"); 
route.post("/teams/generate-code", permissions.isTrainer,  TeamsController.generateTeamCode);
route.post("/teams", permissions.isTrainer, TeamsController.createTeam);
route.get("/teams", TeamsController.getTeams);

module.exports = route;