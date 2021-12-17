const CoursesAdapter = require("./adapters/CoursesAdapter");
class CoursesController{
    async getAllCourses(req, res){
       try{ 
           const courses = await CoursesAdapter.getAllCourses();
           return res.send(courses);
       }catch (e){
           res.status(400).send({message: "Occorred one or more errors then get All Courses. Try Again!"})
       }
    }
    async createCourse(req, res){
        try{
            const { name }  = req.body;
            if(name == null){
                res.status(400).status({message: "Param name is necessary. Try again."})
            }
            await CoursesAdapter.createCourse(name);
            
        }catch(e){
            return res.status(400).send({message: "Occurred one or more errors when created the course. Try Again."})
        }
        
    }
    updateCourse(req, res){

    }
    deleteCourse(){
        
    }
}

module.exports = new CoursesController();