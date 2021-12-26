const individualWorkoutsAdapter = require("./adapters/IndividualWorkoutsAdapter");
const individualWorkoutsByTeam = require("./adapters/TeamWorkoutsAdapter");
class ManageIndividualWorkoutsController{
    async getAllWorkouts(req, res){
        try{
            const {id: trainer_id} = req.userId;
            const {size:sizeIndividualWorkoutsWithoutTeam, workouts:individualWorkoutsWithoutTeam} = await individualWorkoutsAdapter.getAllIndividualWorkouts(trainer_id);
            const {size:sizeIndividualWorkoutsByTeam, workouts:individualWorkoutsWithTeam} = await individualWorkoutsByTeam.getAllIndividualWorkouts(trainer_id);
            const total = sizeIndividualWorkoutsWithoutTeam + sizeIndividualWorkoutsByTeam;
            const allIndividualWorkouts = [...individualWorkoutsWithoutTeam, ...individualWorkoutsWithTeam];
            return res.status(200).send({total, workouts:allIndividualWorkouts});
        }catch(error){
            return res.status(400).send({error});
        }
   }
   async createWorkout(req, res){
       try{
           const {id: trainer_id} = req.userId;
           const { name, is_active, athlete_id } = req.body;
           await individualWorkoutsAdapter.createWorkout({ name, is_active, athlete_id, trainer_id });
           return res.status(200).send();
       }catch(error){
           console.log(error);
           return res.status(400).send({error});
       }
   }
}

module.exports = new ManageIndividualWorkoutsController();