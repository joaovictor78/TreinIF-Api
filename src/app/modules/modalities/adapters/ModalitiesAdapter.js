const res = require("express/lib/response");
const { Modalities } = require("../../../models");
class ModalitiesAdapter{
      async createModalitie(modality){
          try{
              console.log(modality);
              await Modalities.create({name: modality});
              return;
          }catch(error){
              throw error;
          }
      }  
      async getAllModalities(){
          try{
              const modalities = await Modalities.findAll({raw: true, attributes: ["id", "name"]});
              return modalities;
          }catch(error){
              throw error;
          }
      }
}
module.exports = new ModalitiesAdapter();