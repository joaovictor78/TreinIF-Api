const route = require("express").Router();
const CoursesController = require("../app/modules/teams/TeamsController");

route.post("/team", CoursesController.createTeam);

module.exports = route;