const { Teams } = require("../../../models");
class TeamAdapter {
    async createTeam(team) {
        try {
            return await Teams.create(team);
        } catch (error) {
            throw error;
        }

    }
    async getTeams(limit, page){
        try{
            let {count:size, rows:teams} = await Teams.findAndCountAll({offset: page * limit, limit});
            console.log(teams);
            return {size, teams};
        } catch(error){
            throw error;
        }
    }
}
module.exports = new TeamAdapter();