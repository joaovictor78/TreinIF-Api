const   RegisterAthleteSupplementaryDataAdapter   = require("../adapters/AthleteDataAdapter")
class AthletesUseCase{
    async registerAthleteSupplementaryData(data){
        try{
            console.log("foi pra essa porra")
            console.log(data);
            const result = await RegisterAthleteSupplementaryDataAdapter.registerAthleteData(data);
        }catch(e){
            console.log(e);
            throw e;
        }
        
    }
}
module.exports = new AthletesUseCase;