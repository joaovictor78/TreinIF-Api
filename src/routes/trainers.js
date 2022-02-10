const route = require("express").Router();
const ManageTrainersOfAthleteController = require("../app/modules/trainers/manage_trainers_of_athlete/ManageTrainersOfAthleteController");
route.get("/trainers-by-individual-workotus", ManageTrainersOfAthleteController.getAllTrainers);
module.exports = route;