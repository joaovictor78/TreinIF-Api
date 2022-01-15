const { ValueDataPointOfAthleteHistoric } = require("../../../models");

class ValueDataPointOfAthleteHistoricAdapter{
   async addDataPointValue(data, data_point_id){
       try{
           await ValueDataPointOfAthleteHistoric.create({ ...data, data_point_id });
           return;
       }catch(error){
           throw error;
       }
   }
   async updateDataPointValue(data, data_point_value_id){
       try{
           await ValueDataPointOfAthleteHistoric.update({ ...data }, { where: { id: data_point_value_id }});
       } catch(error){
           throw error;
       }
   }
   async removeDataPointValue(data_point_value_id){
       try{
           await ValueDataPointOfAthleteHistoric.destroy({ where: { id: data_point_value_id }});
       } catch(error){
           throw error;
       }
   }
}

module.exports = new ValueDataPointOfAthleteHistoricAdapter();