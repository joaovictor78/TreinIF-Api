const teamWorkoutsAdapter = require("./adapters/TeamWorkoutsAdapter");
class ManageWorkoutsByTeamController {
    async createWorkout(req, res) {
        try {
            const { name, is_active, team_id, athlete_id } = req.body;
            await teamWorkoutsAdapter.createWorkout({ name, is_active, athlete_id, team_id });
            return res.status(200).send();
        } catch (error) {
            return res.status(400).send({ error });
        }
    }
    async getAllWorkoutsByTeam(req, res) {
        try {
            const  { team_id } = req.body;
            const { size, workouts } = await teamWorkoutsAdapter.getAllTeamWorkouts(team_id);
            return res.status(200).send({ size, workouts });
        } catch (error) {
            console.log(error);
            return res.status(400).send({ error });
        }
    }
}

module.exports = new ManageWorkoutsByTeamController();