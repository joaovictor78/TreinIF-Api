const ValueDataPointOfAthleteHistoricAdapter = require("../adapters/ValueDataPointOfAthleteHistoricAdapter");
class AddValueDataPointHistoricOfAthleteUseCase{
   async addValueDataPoint(data, data_point_id){
       try{
           const valueDataPoint =  await ValueDataPointOfAthleteHistoricAdapter.addDataPointValue(data, data_point_id);
           return valueDataPoint;
       } catch(error){
           throw error;
       }
   }
}

module.exports = new AddValueDataPointHistoricOfAthleteUseCase();