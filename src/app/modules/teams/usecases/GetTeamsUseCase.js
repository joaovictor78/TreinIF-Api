const teamAdapter = require("../adapters/TeamAdapter");
class GetTeamsUseCase{
  async getTeams(trainer_id){
        try{
            const teams = await teamAdapter.getTeams(trainer_id);
            console.log(teams);
            return teams;
        }catch(error){
            throw error;
        }

    }
}
module.exports = new GetTeamsUseCase();