const DataPointOfAthleteHistoricAdapter  = require("../adapters/DataPointOfAthleteHistoricAdapter");
class GetListAllAthletesWithHistoric{
    async getAllAthletes(trainer_id){
        try{
            const athletes = await DataPointOfAthleteHistoricAdapter.getAllAthletesWithDataPoint(trainer_id);
            return athletes;
        } catch(error){
            console.log(error);
            throw error;
        }
    }
}
module.exports = new GetListAllAthletesWithHistoric();