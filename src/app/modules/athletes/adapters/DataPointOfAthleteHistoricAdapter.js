const { DataPointOfAthleteHistoric } = require("../../../models");
class DataPointOfAthleteHistoricAdapter{
   async createDataPoint(athlete_id, trainer_id){
       try{ 
           await DataPointOfAthleteHistoric.create({athlete_id, trainer_id});
       }catch(error){
           throw error;
       }
   }
}

module.exports = new DataPointOfAthleteHistoricAdapter();