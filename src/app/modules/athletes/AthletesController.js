const  registerUserCase  = require("./usecases/athletes_usecase");
class AthletesController{
    async registerSupplementaryData(req, res){
        try{
           const data = req.body;
           const result = await registerUserCase.registerAthleteSupplementaryData(data);
        }catch(e){
            console.log(e);
        }
    }
}

module.exports = new AthletesController();