const DataPointOfAthleteHistoricAdapter  = require("../adapters/DataPointOfAthleteHistoricAdapter");
const ValueDataPointOfAthleteHistoricAdapter = require("../adapters/ValueDataPointOfAthleteHistoricAdapter");
class AddHistoricOfAthleteUseCase{
   async addDataPoint(athlete_id, trainer_id, data_point_values=[]){
       try{
          const { id } =  await DataPointOfAthleteHistoricAdapter.createDataPoint(athlete_id, trainer_id);
          data_point_values.map(async (value) =>  {
            await ValueDataPointOfAthleteHistoricAdapter.addDataPointValue(value, id);
          } );
       } catch (error){
           throw error;
       }
   }
}

module.exports = new AddHistoricOfAthleteUseCase();