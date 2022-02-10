const createTeamCodeUseCase = require("./usecases/CreateTeamCodeUseCase");
const createTeamUseCase = require("./usecases/CreateTeamUseCase");
const getTeamsUseCase = require("./usecases/GetTeamsUseCase");
const getAllAthletesOfTeam = require("./usecases/GetAllAthletesOfTeamUseCase");
const addAthleteToTeam = require("./usecases/AddAthleteToTeamUseCase");
const RolesEnum = require("./../../utils/roles_enum");
class TeamsController {
    async generateTeamCode(req, res) {
        try {
            const { code_id, team_code: code, } = await createTeamCodeUseCase.generateCode();
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
    async getTeams(req, res) {
        try {
            const userId = req.userId;
            let teams;
            if(req.role_id === RolesEnum.Athlete){
                teams = await getTeamsUseCase.getTeams(null, userId);
            } else{
                teams = await getTeamsUseCase.getTeams(userId, null);
            }
            return res.status(200).send(teams);
        } catch (error) {
            console.log(error);
            return res.status(400).send({ error });
        }
    }
    async getAllAthletesOfTeams(req, res) {
        try { 
            const team_id = req.params.id;
            const athletes = await getAllAthletesOfTeam.getAll(team_id);
            return athletes;
        } catch (error) {
            return res.status(400).send(error);
        }
    }
    async addAthleteToTeam(req, res) {
        try{
            const athlete_id = req.userId;
            const code = req.params.code;
            await addAthleteToTeam.addAthleteToTeam(code, athlete_id);
        } catch(error) {
            return res.status(400).send(error);
        }
    }
}
module.exports = new TeamsController();