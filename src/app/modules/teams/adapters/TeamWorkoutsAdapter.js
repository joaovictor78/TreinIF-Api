const { TeamWorkouts } = require("../../../models");
const TeamAdapter = require("./TeamAdapter");
const { Op } = require("sequelize");
class WorkoutsAdapter {
    async getTeamsByWorkouts(trainer_id) {
        try {
            const teamsID = await TeamAdapter.getTeamsID(trainer_id);
            console.log(teamsID);
            const teams = await TeamWorkouts.findAll({
                where: {
                    team_id: teamsID,
                    athlete_id: null
                },
                attributes: ["id"],
                include: [
                    {
                        association: 'team',
                        attributes: ["id", "name", "description"],
                        include: [{ association: 'modality', attributes: ["name"] }]
                    }
                ]
            });
            const convertData = teams.map((element) => {
                const { id:workout_id, } = element;
                const { id, name, description } = element.team;
                const { name:modality } = element.team.modality;
                return { id, name, description, modality, workout_id };
            });
            return  convertData ;
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
}

module.exports = new WorkoutsAdapter();