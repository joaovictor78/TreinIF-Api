const teamAdapter = require("../adapters/TeamAdapter");

class AddAthleteToTeamUseCase{
    async addAthleteToTeam(code, athlete_id){
        try{
          await teamAdapter.addAthleteToTeam(code, athlete_id);
        } catch(error){
            throw error;
        }
    }
}

module.exports = new AddAthleteToTeamUseCase();