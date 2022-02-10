const getAllTrainersByIndividualWorkoutsAdapter = require("../adapters/GetAllTrainersByIndividualWorkoutsAdapter");

class ManageTrainersOfAthleteController{
    async getAllTrainers(req, res){
        try {
            const athlete_id = req.userId;
            const trainers = await getAllTrainersByIndividualWorkoutsAdapter.getAllTrainers(athlete_id);
            return res.status(200).send(trainers);
        }catch(error){
            return res.status(400).send({ error });
        }
    }
}

module.exports = new ManageTrainersOfAthleteController();