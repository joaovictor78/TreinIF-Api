const ValueDataPointOfAthleteHistoricAdapter = require("../adapters/ValueDataPointOfAthleteHistoricAdapter");

class DeleteValueDataPointHistoricOfAthleteUseCase{
    async deleteDataPointValue(data_point_value_id){
        try{
            await ValueDataPointOfAthleteHistoricAdapter.removeDataPointValue(data_point_value_id);
        }catch(error){
            throw error;
        }
    }
}

module.exports = new DeleteValueDataPointHistoricOfAthleteUseCase();