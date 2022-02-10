const { Teams } = require("../../../models");
const { AthleteData } = require("../../../models");
const { TeamCode } = require("../../../models");
class TeamAdapter {
    async createTeam(team) {
        try {
            return await Teams.create(team);
        } catch (error) {
            throw error;
        }
    }
    async getTeamsID(trainer_id) {
        try {
            const teams = await Teams.findAll({
                where: { trainer_id },
                raw: true
            });
            const teamsID = teams.map((team) => {
                return team.id;
            });
            return teamsID;
        } catch (error) {
            throw error;
        }
    }
    async getTeams(trainer_id) {
        try {
            const teams = await Teams.findAll({
                where: { trainer_id },
                attributes: ["id", "name", "description", "trainer_id"],
                include: [
                    { association: "code", attributes: ["id", "code"] },
                    { association: "modality", attributes: ["id", "name"] }
                ]
            });
            return teams;
        } catch (error) {
            throw error;
        }
    }
    async getAllAthletesOfTeam(team_id){
        try {
            const athletes = await Teams.getAthletes({
                where: {
                    team_id
                }
            });
            return athletes;
        } catch(error){
            throw error;
        }
    }
    async addAthleteToTeam(code, athlete_id){
        try {
            const athlete = await AthleteData.findByPk(athlete_id);
            const team_code = await TeamCode.findOne({where: { code },   include: [
                { association: "team" } ] });
            const team = await Teams.findByPk(team_code.team.id);
            await team.addAthlete(athlete);
            return;
        } catch(error){
            console.log(error);
            throw error;
        }
    }
}
module.exports = new TeamAdapter();