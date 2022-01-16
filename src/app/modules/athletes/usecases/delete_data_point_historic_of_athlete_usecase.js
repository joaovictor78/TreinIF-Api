const DataPointOfAthleteHistoricAdapter = require("../adapters/DataPointOfAthleteHistoricAdapter");
class DeleteDataPointHistoricOfAthleteUseCase{
    async removeDataPoint(data_point_id){
        try{
            await DataPointOfAthleteHistoricAdapter.removeDataPointOfAthlete(data_point_id);
        } catch(error){
            throw error;
        }
    }
}

module.exports = new DeleteDataPointHistoricOfAthleteUseCase();