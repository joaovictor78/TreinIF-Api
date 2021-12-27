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
                    [Op.not]: [
                        { athlete_id: null }
                    ]
                },
                include: [
                    { association: 'team', where: { trainer_id } }
                ]
            });
            return { size, workouts };
        } catch (error) {
            console.log("Erro aqui", error);
            throw error;
        }
    }
    async getAllTeamWorkouts(team_id) {
        try {
            console.log(team_id)
            const { count: size, rows: workouts } = await TeamWorkouts.findAndCountAll({
                where: {
                    athlete_id: null,
                    team_id
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