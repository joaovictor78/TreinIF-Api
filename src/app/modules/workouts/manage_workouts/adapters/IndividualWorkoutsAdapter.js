const { IndividualWorkouts } = require("../../../../models");
const { Op } = require("sequelize");
class IndividualWorkoutsAdapter {
    async createWorkout(workout) {
        try {
            console.log(workout);
            const workout = await IndividualWorkouts.create(workout);
            return;
        } catch (error) {
            throw error;
        }
    }
    async getAllIndividualWorkouts(trainer_id, athlete_id) {
        try {
            console.log(athlete_id)
            const {count:size, rows:workouts} = await IndividualWorkouts.findAndCountAll({where: {trainer_id, athlete_id}});
            console.log({size, workouts})
            return {size, workouts};
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
    async updateWorkoutName(workout_name, workout_id){
        try {
            const { name } = workout_name;
            console.log("aquiii", name, workout_id);
            await IndividualWorkouts.update({ name }, { where: { id: workout_id } });
        } catch (error){
            console.log(error);
            throw error;
        }
    }
    async updateTrainingStatus(workout_id, athlete_id, trainer_id){
        try{
            await IndividualWorkouts.update({is_active:true},  { where: { athlete_id, trainer_id, id: workout_id } } );
            await IndividualWorkouts.update({is_active:false},  { where: { athlete_id, trainer_id, [Op.not]: { id:workout_id } } } );
        } catch(error){
            console.log(error)
            throw error;
        }
    }
    async removeWorkout(workout_id){
        try {
            await IndividualWorkouts.destroy({where: { id:workout_id } });
        } catch(error){
            throw error;
        }
    }

}

module.exports = new IndividualWorkoutsAdapter();