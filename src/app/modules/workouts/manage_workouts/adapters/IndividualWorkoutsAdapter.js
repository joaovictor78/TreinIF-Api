const { IndividualWorkouts } = require("../../../../models");
class IndividualWorkoutsAdapter {
    async createWorkout(workout) {
        try {
            console.log(workout);
            await IndividualWorkouts.create(workout);
            return;
        } catch (error) {
            throw error;
        }
    }
    async getAllIndividualWorkouts(trainer_id, athlete_id) {
        try {
            console.log("Trainer id", trainer_id)
            const {count:size, rows:workouts} = await IndividualWorkouts.findAndCountAll({where: {trainer_id, athlete_id}});
            console.log("Aquiiii");
            console.log({size, workouts})
            return {size, workouts};
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
    async updateTrainingStatus(workout_id, athlete_id, trainer_id){
        try{
            await TeamWorkouts.update({is_active:true},  { where: { athlete_id, trainer_id, workout_id } } );
            await TeamWorkouts.update({is_active:false},  { where: { team_id, trainer_id, [Op.not]: workout_id } } );
        } catch(error){
            throw error;
        }
    }

}

module.exports = new IndividualWorkoutsAdapter();