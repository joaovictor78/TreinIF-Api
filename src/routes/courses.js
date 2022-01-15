const route = require("express").Router();
const CoursesController = require("../app/modules/courses/CoursesController");
const permissions = require("../app/middlewares/auth_service"); 
route.post('/course', CoursesController.createCourse);
route.use(permissions.allUsers);
route.get('/courses', permissions.allUsers, CoursesController.getAllCourses);
module.exports = route;