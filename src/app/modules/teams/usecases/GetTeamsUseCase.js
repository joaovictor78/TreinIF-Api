const teamAdapter = require("../adapters/TeamAdapter");
class GetTeamsUseCase{
  async getTeams(limit, page){
        try{
            const {size, teams} = await teamAdapter.getTeams(limit, page);
            console.log(teams);
            return {size, teams};
        }catch(error){
            throw error;
        }

    }
}
module.exports = new GetTeamsUseCase();