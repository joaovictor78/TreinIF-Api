const { Teams } = require("../../../models");
class TeamAdapter {
    async createTeam(team) {
        try {
            console.log("FOI PRA CA", team);
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
}
module.exports = new TeamAdapter();