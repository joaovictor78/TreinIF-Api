const { TeamWorkouts } = require("../../../../models");
const { Teams } = require("../../../../models");
const { Op } = require("sequelize");
class TeamWorkoutsAdapter {
    async createWorkout(workout) {
        try {
            await TeamWorkouts.create(workout);
            return;
        } catch (error) {
            throw error;
        }
    }
    async getAllAthletesOfTeam(team_id) {
        try{
            const team = await Teams.findByPk(team_id);
            const athletes = await team.getAthletes();
            console.log(athletes)
            const athletesDTO = athletes.map((element) => {
                const { id, birth_date, blood_type, CPF, RG, user_id, course_id } = element;
                return { id, birth_date, blood_type, CPF, RG, user_id, course_id };
            });
            return athletesDTO;
        } catch (error){
            throw error;
        }
    }
    async getAllTeamWorkouts(team_id) {
        try {
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
            return;
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
   async updateWorkoutName(workout_id, team_id, workout_name) {
       try {
           await TeamWorkouts.update({name: workout_name}, { where: { team_id, id: workout_id }});
           return;
       } catch (error){
           throw error;
       }
   }
   async removeWorkout(workout_id, team_id) {
       try{
           await TeamWorkouts.destroy({ where: { team_id, id: workout_id } });
           return;
       } catch(error){
           throw error;
       }
   }
}

module.exports = new TeamWorkoutsAdapter();