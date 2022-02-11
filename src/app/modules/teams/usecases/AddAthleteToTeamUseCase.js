const teamAdapter = require("../adapters/TeamAdapter");

class AddAthleteToTeamUseCase{
    async addAthleteToTeam(code, user_id){
        try{
          const team = await teamAdapter.addAthleteToTeam(code, user_id);
          return team;
        } catch(error){
            throw error;
        }
    }
}

module.exports = new AddAthleteToTeamUseCase();