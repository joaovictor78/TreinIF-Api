const DataPointOfAthleteHistoricAdapter = require("../adapters/DataPointOfAthleteHistoricAdapter");
class UpdateDateDataPointOfHistoricOfAthleteUseCase{
    async updateDate(date, data_point_id){
        try{
            console.log("chamou");
            await DataPointOfAthleteHistoricAdapter.updateDateDataPointOfAthlete(date, data_point_id);
            return;
        } catch(error){
            throw error;
        }
    }
}

module.exports = new UpdateDateDataPointOfHistoricOfAthleteUseCase();