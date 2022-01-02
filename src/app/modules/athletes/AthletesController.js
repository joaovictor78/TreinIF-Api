const  registerUserCase  = require("./usecases/register_athletes_usecase");
const searchAthletesWithFilterUseCase = require("./usecases/search_athletes_whith_filter_usecase");
class AthletesController{
    async registerSupplementaryData(req, res){
        try{
           const data = req.body;
           const result = await registerUserCase.registerAthleteSupplementaryData(data);
           if(!!result){
               return res.status(200).send({data: result});
           }
        }catch(e){
            console.log(e);
            return res.status(400).send({message: "Occurred one or more errors then created the user"})
          
        }
    }
    async getAllAthletesWithFilter(req, res){
        try{
            let { limit = 10, page = 1 } = req.query;
            limit = parseInt(limit);
            page = (parseInt(page) - 1);
            const { full_name, email } = req.body;
            const { size, athletes } = await searchAthletesWithFilterUseCase.searchAthletesWithFilter(limit, page, full_name, email);
            return res.status(200).send({ size, athletes });
        }catch(e){
            console.log(e);
            return res.status(400).send({message: "An error occurred while making the query."});
        }
    }
}

module.exports = new AthletesController();