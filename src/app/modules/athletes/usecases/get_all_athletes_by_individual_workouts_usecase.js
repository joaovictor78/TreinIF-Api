const  AthleteDataAdapter  = require("../adapters/AthleteDataAdapter");
const TeamsAdapter = require("../adapters/TeamsAdapter");
class GetAllAthletesByIndividualWorkoutsUseCase{
  async getAllAthletesByIndividualWorkouts(trainer_id){
      try{
          const listTeamsIdOfTrainer = await TeamsAdapter.getTeams(trainer_id);
          const athletes = await AthleteDataAdapter.getAllAthletesByIndividualWorkouts(trainer_id, listTeamsIdOfTrainer);
          return athletes;
      }catch(error){
          throw error;
      }
  }
}
module.exports = new GetAllAthletesByIndividualWorkoutsUseCase();