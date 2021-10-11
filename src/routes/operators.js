const route = require("express").Router();
const OperatorController = require("../app/modules/operators/OperatorController");
route.use('/create', OperatorController.create);
route.use('/get', OperatorController.get);
route.use('/delete', OperatorController.delete);

module.exports = route;