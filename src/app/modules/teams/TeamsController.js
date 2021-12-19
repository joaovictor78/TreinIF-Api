const createTeamCodeUseCase = require("./usecases/CreateTeamCodeUseCase");
const createTeamUseCase = require("./usecases/CreateTeamUseCase");
class TeamsController {
    async generateTeamCode(req, res) {
        try {
            const { code } = await createTeamCodeUseCase.generateCode();
            res.send({code});
        } catch (error) {
            res.status(400).send(error);
        }
    }
    async createTeam(req, res){ 
        try{
            const userId = req.userId;
            const teamData = {...req.body, userId};
         
           await createTeamUseCase.createTeam(teamData);
           res.status(200).send({message: "team created with sucess"});
        }catch(error){
            return res.status(400).send({error});
        }
    }
}
module.exports = new TeamsController();