const teamCodeAdapter = require("../adapters/TeamCodeAdapter");
class CreateTeamCodeUseCase{
    async generateCode(){
        try{
            const code = Math.random().toString(36).substring(2);
            const team_code =  await teamCodeAdapter.createTeamCode(code);
            return team_code;
        } catch(error){
            throw error;
        }
       
    }
}
module.exports = new CreateTeamCodeUseCase();