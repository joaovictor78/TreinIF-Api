const teamCodeAdapter = require("../adapters/TeamCodeAdapter");
const teamAdapter = require("../adapters/TeamAdapter");
class CreateTeamUseCase {
    async createTeam(teamData) {
        try {
            const { name, description, modality_id, code_id } = teamData;  
            const trainer_id = teamData.userId;
            const team = await teamAdapter.createTeam({ name, description, modality_id, trainer_id });
            console.log(team.id);
            const team_id = team.id;
            const teams = await teamCodeAdapter.updateTeamCodeAdapter(code_id, team_id);
            return teams;
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
}

module.exports = new CreateTeamUseCase();