const { Teams } = require("../../../models");
class TeamAdapter {
    async createTeam(team) {
        try {
            return await Teams.create(team);
        } catch (error) {
            throw error;
        }

    }
    async getTeams(limit, page, trainer_id) {
        try {
            let { count: size, rows: teams } = await Teams.findAndCountAll({
                where: { trainer_id }, offset: page * limit, limit,
            });
            return { size, teams };
        } catch (error) {
            throw error;
        }
    }
}
module.exports = new TeamAdapter();