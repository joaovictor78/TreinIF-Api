const { Courses } = require("../../../models");
class CoursesAdapter{
    async getAllCourses(){
        
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