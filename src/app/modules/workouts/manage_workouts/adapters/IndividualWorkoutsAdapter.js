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
    async getAllIndividualWorkouts(trainer_id) {
        try {
            console.log("Trainer id", trainer_id)
            const {count:size, rows:workouts} = await IndividualWorkouts.findAndCountAll({where: {trainer_id}});
            console.log("Aquiiii");
            console.log({size, workouts})
            return {size, workouts};
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
}

module.exports = new IndividualWorkoutsAdapter();