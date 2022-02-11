const TeamAdapter = require("../adapters/TeamAdapter");
class GetAllAthletesOfTeamUseCase{
    async getAllAthletes(team_id){
        try{
           const athletes =  await TeamAdapter.getAllAthletesOfTeam(team_id);
           return athletes;
        } catch(error){
            console.log(error);
           throw error;   
        }
    }
}


module.exports = new GetAllAthletesOfTeamUseCase();