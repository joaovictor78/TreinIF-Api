const route = require("express").Router();
const CoursesController = require("../app/modules/courses/CoursesController");
route.post('/create', CoursesController.createCourse);

module.exports = route;