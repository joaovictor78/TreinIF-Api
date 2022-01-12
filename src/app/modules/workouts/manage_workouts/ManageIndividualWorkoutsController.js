const individualWorkoutsAdapter = require("./adapters/IndividualWorkoutsAdapter");
class ManageIndividualWorkoutsController {
    async getAllWorkouts(req, res) {
        try {
            const trainer_id = req.userId;
            const { athlete_id }  = req.body;
            const { size, workouts } = await individualWorkoutsAdapter.getAllIndividualWorkouts(trainer_id, athlete_id);
            return res.status(200).send({ size, workouts });
        } catch (error) {
            console.log(error);
            return res.status(400).send({ error });
        }
    }
    async createWorkout(req, res) {
        try {
            const trainer_id = req.userId;
            const { name, is_active, athlete_id } = req.body;
            await individualWorkoutsAdapter.createWorkout({ name, is_active, athlete_id, trainer_id });
            return res.status(200).send();
        } catch (error) {
            console.log(error);
            return res.status(400).send({ error });
        }
    }
    async updateTrainingStatus(req, res) {
        try {
            const { workout_id } = req.params;
            const trainer_id = req.userId;
            const { athlete_id } = req.query;
            await individualWorkoutsAdapter.updateTrainingStatus(workout_id, athlete_id, trainer_id);
            return res.status(200).send({message: "Training status updated successfully"});
        } catch (error) {
            return res.status(400).send({ error: "There was an error updating the training status" })
        }
    }
}

module.exports = new ManageIndividualWorkoutsController();