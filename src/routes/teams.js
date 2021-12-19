const route = require("express").Router();
const TeamsController = require("../app/modules/teams/TeamsController");

route.post("/teams/generate-code", TeamsController.generateTeamCode);
route.post("/teams", TeamsController.createTeam);
route.get("/teams", TeamsController.getTeams);

module.exports = route;