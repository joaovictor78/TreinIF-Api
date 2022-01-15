const DataPointOfAthleteHistoricAdapter  = require("../adapters/DataPointOfAthleteHistoricAdapter");
class GetHistoricOfAthleteUseCase{
    async getHistoricOfAthlete(athlete_id, trainer_id){
        try{
            const data_points = await DataPointOfAthleteHistoricAdapter.getAllDataPointOfAthlete(athlete_id, trainer_id);
            return data_points;
        } catch(error){
            throw error;
        }
    }
}
module.exports = new GetHistoricOfAthleteUseCase();