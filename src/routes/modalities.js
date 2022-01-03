const route = require("express").Router();
const ModalitiesController = require("../app/modules/modalities/ModalitiesController");
const permissions = require("../app/middlewares/auth_service"); 
route.post("/modalities", permissions.isAdmin,  ModalitiesController.createModality);
route.get("/modalities", ModalitiesController.getAllModalities);

module.exports = route;