const teamAdapter = require("../adapters/TeamAdapter");
class GetTeamsUseCase{
  async getTeamsByWorkouts(trainer_id){
        try{
            const teams = await teamAdapter.getTeams(limit, page);
            console.log(teams);
            return teams;
        }catch(error){
            throw error;
        }

    }
}
module.exports = new GetTeamsUseCase();