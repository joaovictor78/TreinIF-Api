const modalitiesAdapter = require("./adapters/ModalitiesAdapter");
class ModalitiesController{
    async createModality(req, res){
        try{
            const { name } = req.body;
            await modalitiesAdapter.createModalitie(name);
            res.status(200).send();
        }catch(error){
            console.log(error);
            res.status(400).send({error: "An error occurred while creating a new modality"});
        }
    }
    async getAllModalities(req, res){
        try{
            const modalities = await modalitiesAdapter.getAllModalities();
            return res.status(200).send({modalities});
        }catch(error){
            console.log(error);
            res.status(400).send({error: "There was an error getting the modalities"});
        }
    }
}

module.exports = new ModalitiesController();