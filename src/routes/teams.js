const route = require("express").Router();
const TeamsController = require("../app/modules/teams/TeamsController");
const permissions = require("../app/middlewares/auth_service"); 
route.post("/teams/generate-code", permissions.isTrainer,  TeamsController.generateTeamCode);
route.post("/teams", permissions.isTrainer, TeamsController.createTeam);
route.post("/teams/:code", permissions.allUsers, TeamsController.addAthleteToTeam);
route.get("/teams", permissions.allUsers, TeamsController.getTeams);
route.get("/teams/:id/athletes", permissions.allUsers, TeamsController.getAllAthletesOfTeams);
module.exports = route;