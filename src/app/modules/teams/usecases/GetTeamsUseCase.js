const teamAdapter = require("../adapters/TeamAdapter");
class GetTeamsUseCase{
  async getTeams(trainer_id, athlete_id){
        try{
            let teams;
            if(trainer_id == null){
                teams = await teamAdapter.getTeamsAsAthlete(athlete_id);
            } else {
                teams = await teamAdapter.getTeamsAsTrainer(trainer_id);
            }
            console.log(teams);
            return teams;
        }catch(error){
            throw error;
        }

    }
}
module.exports = new GetTeamsUseCase();