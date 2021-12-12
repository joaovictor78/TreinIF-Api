const  registerUserCase  = require("./usecases/athletes_usecase");
class AthletesController{
    async registerSupplementaryData(req, res){
        const data = req.body;
        console.log("merda");
        console.log(data);
        try{
           const result = await registerUserCase.registerAthleteSupplementaryData(data);
        }catch(e){
            console.log(e);
        }
    }
}

module.exports = new AthletesController();