const { getTeams } = require("./adapters/TeamAdapter");
const  getTeamsByWorkouts  = require("./adapters/TeamWorkoutsAdapter");
const createTeamCodeUseCase = require("./usecases/CreateTeamCodeUseCase");
const createTeamUseCase = require("./usecases/CreateTeamUseCase");
const getTeamsUseCase = require("./usecases/GetTeamsUseCase");
class TeamsController {
    async generateTeamCode(req, res) {
        try {
            const { code_id,  team_code:code, } = await createTeamCodeUseCase.generateCode();
            res.send({ code_id, code });
        } catch (error) {
            res.status(400).send(error);
        }
    }
    async createTeam(req, res) {
        try {
            const userId = req.userId;
            const { name, description, modality_id, code_id } = req.body;
            const teamData = { name, description, modality_id, code_id, userId };
            await createTeamUseCase.createTeam(teamData);
            res.status(200).send({ message: "team created with sucess" });
        } catch (error) {
            return res.status(400).send({ error });
        }
    }
    async getTeamsByWorkouts(req, res){
        try{
            const trainer_id = req.userId;
            const teams = await getTeamsByWorkouts.getTeamsByWorkouts(trainer_id);
            return res.status(200).send({teams});
        }catch(error){
            return res.status(400).send({error});
        }
    }
    async getTeams(req, res) {
        try {
            const trainer_id = req.userId;
            const teams = await getTeamsUseCase.getTeams(trainer_id);
            res.status(200).send(teams);
        } catch (error) {
            return res.status(400).send({ error });
        }
    }
}
module.exports = new TeamsController();