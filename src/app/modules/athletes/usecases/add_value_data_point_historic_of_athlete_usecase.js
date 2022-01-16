const ValueDataPointOfAthleteHistoricAdapter = require("../adapters/ValueDataPointOfAthleteHistoricAdapter");
class AddValueDataPointHistoricOfAthleteUseCase{
   async addValueDataPoint(data, data_point_id){
       try{
           await ValueDataPointOfAthleteHistoricAdapter.addDataPointValue(data, data_point_id);
           return;
       } catch(error){
           throw error;
       }
   }
}

module.exports = new AddValueDataPointHistoricOfAthleteUseCase();