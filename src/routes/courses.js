const route = require("express").Router();
const CoursesController = require("../app/modules/courses/CoursesController");
route.post('/course', CoursesController.createCourse);
route.get('/courses', CoursesController.getAllCourses);
module.exports = route;