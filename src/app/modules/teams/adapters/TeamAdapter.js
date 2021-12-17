const { Teams } = require("../../../models");
class TeamAdapter{
    async createTeam(team){
        try{
            await  Teams.create(team);
        }catch (e){
            throw e;
        }
    
    }
}
module.exports = new TeamAdapter();