const { TeamWorkouts } = require("../../../../models");
const { Op } = require("sequelize");
class TeamWorkoutsAdapter {
    async createWorkout(workout) {
        try {
            console.log(workout);
            await TeamWorkouts.create(workout);
            return;
        } catch (error) {
            throw error;
        }
    }
    async getAllIndividualWorkouts(trainer_id) {
        try {
            console.log(trainer_id)
            const { count: size, rows: workouts } = await TeamWorkouts.findAndCountAll({
                where: {
                    trainer_id,
                    [Op.not]: [
                        { athlete_id: null }
                    ]
                }
            });
            return { size, workouts };
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
    async getAllTeamWorkouts(trainer_id) {
        try {
            console.log(trainer_id)
            const { count: size, rows: workouts } = await TeamWorkouts.findAndCountAll({
                where: {
                    trainer_id,
                    athlete_id: null
                }
            });
            return { size, workouts };
        } catch (error) {
            console.log(error);
            throw error;
        }
    }

}

module.exports = new TeamWorkoutsAdapter();