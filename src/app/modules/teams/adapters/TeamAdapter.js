const { Teams } = require("../../../models");
class TeamAdapter {
    async createTeam(team) {
        try {
            return await Teams.create(team);
        } catch (e) {
            throw e;
        }

    }
}
module.exports = new TeamAdapter();