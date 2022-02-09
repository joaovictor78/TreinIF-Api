const teamWorkoutsAdapter = require("./adapters/TeamWorkoutsAdapter");
class ManageWorkoutsByTeamController {
    async createWorkout(req, res) {
        try {
            const { team_id } = req.params;
            const { name } = req.body;
            const is_active = false;
            await teamWorkoutsAdapter.createWorkout({ name, is_active, team_id });
            return res.status(200).send();
        } catch (error) {
            console.log(error);
            return res.status(400).send({ error });
        }
    }
    async getAllAthletesOfTeam(req, res) {
        try{
            const  { team_id } = req.params;
            const athletes = await teamWorkoutsAdapter.getAllAthletesOfTeam(team_id);
            return res.status(200).send(athletes);
        }catch(error){
            return res.status(400).send({ error });
        }
    }
    async getAllWorkoutsByTeam(req, res) {
        try {
            const  { team_id } = req.params;
            const { size, workouts } = await teamWorkoutsAdapter.getAllTeamWorkouts(team_id);
            return res.status(200).send({ size, workouts });
        } catch (error) {
            console.log(error);
            return res.status(400).send({ error });
        }
    }
    async updateTrainingStatus(req, res){
        try{
            const { team_id, workout_id } = req.params;
            await teamWorkoutsAdapter.updateTrainingStatus(workout_id, team_id);
            return res.status(200).send({message: "Training status updated successfully"});
        }catch (error) {
            return res.status(400).send({error: "There was an error updating the training status"});
        }
    }
    async updateWorkoutName(req, res){
        try{
            const { team_id, workout_id } = req.params;
            const { name } = req.body;
            await teamWorkoutsAdapter.updateWorkoutName(workout_id, team_id, name);
            return res.status(200).send({message: "Workout name updated successfully"});
        }catch (error){
            console.log(error);
            return res.status(400).send({error: "There was an error updating the workout name"});
        }
    }
    async removeWorkout(req, res){
        try{
            const { team_id, workout_id } = req.params;
            await teamWorkoutsAdapter.removeWorkout( workout_id, team_id );
            return res.status(200).send({message: "Workout removed successfully"});
        }catch (error){
            return res.status(400).send({error: "There was an error delete the workout name"});
        }
    }
}

module.exports = new ManageWorkoutsByTeamController();