const { TeamCode } = require("../../../models");
const { Op } = require("sequelize");
class TeamCodeAdapter {
    async createTeamCode(code) {
        try {
            const availableTeamCodes = await TeamCode.findOrCreate({
                where: {
                    team_id: null,
                    [Op.not]: {
                        code
                    }
                },
                defaults: {
                    code
                },
                raw: true
            });
            console.log(availableTeamCodes)
            return availableTeamCodes[0];
        } catch (error) {
            console.log(error);
            throw error;
        }

    }
    async updateTeamCodeAdapter(code_id, team_id){
        console.log("AQUIIII", code_id, team_id)
        try{
            await TeamCode.update({ team_id }, {
                where: {
                  id: code_id
                }
              });
              
        }catch(error){
            console.log("deu merda aqui");
            throw error;
        }
    }
}

module.exports = new TeamCodeAdapter();