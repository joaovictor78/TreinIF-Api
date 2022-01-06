const  AthleteDataAdapter  = require("../adapters/AthleteDataAdapter");
class GetAllAthletesByIndividualWorkoutsUseCase{
  async getAllAthletesByIndividualWorkouts(trainer_id){
      try{
          const athletes = await AthleteDataAdapter.getAllAthletesByIndividualWorkouts(trainer_id);
          return athletes;
      }catch(error){
          throw error;
      }
  }
}
module.exports = new GetAllAthletesByIndividualWorkoutsUseCase();