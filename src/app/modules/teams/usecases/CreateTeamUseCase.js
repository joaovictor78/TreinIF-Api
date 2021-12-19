const teamCodeAdapter = require("../adapters/TeamCodeAdapter");
const teamAdapter = require("../adapters/TeamAdapter");
const req = require("express/lib/request");
class CreateTeamUseCase {
    async createTeam(teamData) {
        try {
            const { name, description, modality_id, code_id } = teamData;  
            const trainer_id = teamData.userId;
            const team = await teamAdapter.createTeam({ name, description, modality_id, trainer_id });
            const team_id = team.id;
            await teamCodeAdapter.updateTeamCodeAdapter(code_id, team_id);
            return;
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
}

module.exports = new CreateTeamUseCase();