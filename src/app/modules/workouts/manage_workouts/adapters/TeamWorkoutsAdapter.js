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
    async getAllTeamWorkouts(team_id) {
        try {
            console.log(team_id)
            const { count: size, rows: workouts } = await TeamWorkouts.findAndCountAll({
                where: {
                    team_id
                }
            });
            return { size, workouts };
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
    async updateTrainingStatus(workout_id, team_id) {
        try {
            await TeamWorkouts.update({ is_active: true }, { where: { team_id, id: workout_id } });
            await TeamWorkouts.update({ is_active: false }, { where: { team_id, [Op.not]: { id: workout_id } } });
        } catch (error) {
            console.log(error);
            throw error;
        }
    }

}

module.exports = new TeamWorkoutsAdapter();