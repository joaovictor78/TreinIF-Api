const teamAdapter = require("./adapters/TeamAdapter");
class TeamController{
    async createTeam(req, res){
        try{
            const {}  = req.body;
            await teamAdapter.createTeam();
            res.send(req.userId);
        }catch(e){

        }
      

    }
}
module.exports = new TeamController();