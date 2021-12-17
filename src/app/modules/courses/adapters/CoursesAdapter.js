const { Courses } = require("../../../models");
class CoursesAdapter{
    async getAllCourses(){
        try{
            const courses =  await Courses.findAll({ raw: true, attributes: ["id", "name"], });
            return courses;
        }catch(e){
            throw e;
        }
    }
    async createCourse(courseName){
        try{
            const course = await Courses.create({name: courseName});
            console.log(course);
        } catch(e){
            throw e;
        }
        
    }
}
module.exports = new CoursesAdapter();