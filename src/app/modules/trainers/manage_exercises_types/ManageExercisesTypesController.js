const  ExercisesTypesAdapter  = require("../adapters/ExercisesTypesAdapter");
class ManageExercisesTypesController{
    async createExerciseType(req, res){
        try{
            const { exercise_type_name } = req.body;
            const trainer_id = req.userId;
            await ExercisesTypesAdapter.createExerciseType({name: exercise_type_name, trainer_id});
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
    async updateExerciseType(req, res){
        try{
            const  exercise_type_id  = req.params.id;
            const  exercise_type_name  = req.body.exercise_type_name;
            await ExercisesTypesAdapter.updateExerciseType(exercise_type_id, exercise_type_name);
            return res.status(200).send({ message: "The exercise updating with success!" });
        }catch(error){
            return res.status(400).send({error: "There was an error when updating the exercise type"});
        }
    }
    async removeExerciseType(req, res){
        try{
            const  exercise_type_id  = req.params.id;
            await ExercisesTypesAdapter.removeExerciseType(exercise_type_id);
            return res.status(200).send({ message: "The exercise removed with success!"});
        } catch(error){
            return res.status(400).send({ error: "There was an error when removing the exercise type" });
        }
    }
}
module.exports = new ManageExercisesTypesController();