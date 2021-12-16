const  registerUserCase  = require("./usecases/athletes_usecase");
class AthletesController{
    async registerSupplementaryData(req, res){
        try{
           const data = req.body;
           const result = await registerUserCase.registerAthleteSupplementaryData(data);
           if(!!result){
               res.status(200).send({data: result});
           }
        }catch(e){
            res.status(400).send({message: "Occurred one or more errors then created the user"})
            console.log(e);
        }
    }
}

module.exports = new AthletesController();