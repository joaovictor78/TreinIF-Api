const ValueDataPointOfAthleteHistoricAdapter = require("../adapters/ValueDataPointOfAthleteHistoricAdapter");

class UpdateValueDataPointHistoricOfAthleteUseCase{
    async updateDataPointValue(data, data_point_id){
        try{
            await ValueDataPointOfAthleteHistoricAdapter.updateDataPointValue(data, data_point_id);
            return;
        } catch(error){
            throw error;
        }
    }
}

module.exports = new UpdateValueDataPointHistoricOfAthleteUseCase();