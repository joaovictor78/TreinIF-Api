const route = require("express").Router();
const CoursesController = require("../app/modules/courses/CoursesController");
const permissions = require("../app/middlewares/auth_service"); 
route.post('/course', permissions.isAdmin,  CoursesController.createCourse);
route.get('/courses', permissions.acessWithoutToken, CoursesController.getAllCourses);
module.exports = route;