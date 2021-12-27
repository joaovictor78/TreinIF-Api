const  ExercisesTypesAdapter  = require("../adapters/ExercisesTypesAdapter");
class ManageExercisesTypesController{
    async createExerciseType(req, res){
        try{
            const { exercise_type } = req.body;
            const trainer_id = req.userId;
            await ExercisesTypesAdapter.createExerciseType({name: exercise_type, trainer_id});
            return res.status(200).send();
        }catch(error){
            console.log(error);
            return res.status(400).send({error: "An error occurred while creating a new exercise type"})
        }
    }
    async getExercisesTypes(req, res){
        try{
            const exercises_types = await ExercisesTypesAdapter.getAllExercisesTypes(req.userId);
            return res.status(200).send({exercises_types});
        }catch(error){
            return res.status(400).send({error: "there was an error taking the types of exercises"});
        }
    }
}
module.exports = new ManageExercisesTypesController();