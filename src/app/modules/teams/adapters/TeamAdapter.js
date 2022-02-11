const { Teams } = require("../../../models");
const { AthleteData } = require("../../../models");
const { TeamCode } = require("../../../models");
class TeamAdapter {
    async createTeam(team) {
        try {
            return await Teams.create(team);
        } catch (error) {
            throw error;
        }
    }
    async getTeamsID(trainer_id) {
        try {
            const teams = await Teams.findAll({
                where: { trainer_id },
                raw: true
            });
            const teamsID = teams.map((team) => {
                return team.id;
            });
            return teamsID;
        } catch (error) {
            throw error;
        }
    }
    async getTeamsAsTrainer(trainer_id){
        try {
            const teams = await Teams.findAll({
                where: trainer_id == null ? { athlete_id } : { trainer_id },
                attributes: ["id", "name", "description", "trainer_id"],
                include: [
                    { association: "code", attributes: ["id", "code"] },
                    { association: "modality", attributes: ["id", "name"] }
                ]
            });
            return teams;
        }
        catch (error) {
            throw error;
        }
    }
    async getTeamsAsAthlete(trainer_id, user_id) {
        try {
        
            const athlete = await AthleteData.findOne({ user_id });
            const teams = await athlete.getTeam();
            const teamsDTO = await Promise.all(teams.map(async (element)  =>  {
                const { id, name, description, trainer_id } = element;
                const { code, modality } = await Teams.findOne({
                    where:  { id },
                    attributes: [],
                    include: [
                        { association: "code", attributes: ["id", "code"] },
                        { association: "modality", attributes: ["id", "name"] }
                    ]
                });
                return  { id, name, description, trainer_id,  code, modality  };
            }));
            return teamsDTO;
        } catch (error) {
            throw error;
        }
    }
    async getAllAthletesOfTeam(team_id){
        try {
            const team = await Teams.findByPk(team_id);
            const athletes = await team.getAthletes({include: [
                {association: 'users'},
                {association: 'course'}
            ]});
            const athletesDTO = athletes.map((element) => {
                const { id, birth_date, blood_type, CPF, RG, user_id } = element;
                const { id:course_id, name }  = element.course;
                const { full_name, email, avatar_url } = element.users;  
                return { id,  full_name, email, avatar_url, birth_date, blood_type, CPF, RG, user_id, course: { id:course_id, name } };
            });
            return athletesDTO;
        } catch(error){
            console.log(error);
            throw error;
        }
    }
    async addAthleteToTeam(code, athlete_id){
        try {
            const athlete = await AthleteData.findByPk(athlete_id);
            const team_code = await TeamCode.findOne({where: { code },   include: [
                { association: "team" } ] });
            console.log(team_code)
            const team = await Teams.findByPk(team_code.team.id);
            await team.addAthlete(athlete);
            return team;
        } catch(error){
            console.log(error);
            throw error;
        }
    }
}
module.exports = new TeamAdapter();