const ExercisesWorkoutAdapter = require("./adapters/ExercisesWorkoutAdapter");
const WorkoutsTypesEnum = require("../../../utils/workouts_types_enum");
class ManageExercisesController {
    async createExercise(req, res) {
        try {
            const { series_number, repeat_time_in_seconds, exercise_type_id, exercise_variation, days_of_week } = req.body;
            let team_workout_id;
            let individual_workout_id;
            if (req.query.type == WorkoutsTypesEnum.Individual) {
                team_workout_id = null;
                individual_workout_id = req.params.id;
            } else if (req.query.type == WorkoutsTypesEnum.Team) {
                team_workout_id = req.params.id;
                individual_workout_id = null;
            }
            const exerciseDTO = { series_number, repeat_time_in_seconds, exercise_variation, exercise_type_id, individual_workout_id, team_workout_id };
            const exerciseByDayOfWeekSelected = await ExercisesWorkoutAdapter.createExercise(exerciseDTO, days_of_week);
            return res.status(200).send(exerciseByDayOfWeekSelected);
        } catch (error) {
            console.log(error);
            return res.status(400).send({ error: "There was an error creating the exercise" });
        }
    }
    async getExercisesByDayOfWeek(req, res) {
        try {
            const workout_id = req.params.id;
            const day_of_week = req.query.day_of_week;
            const exercises = await ExercisesWorkoutAdapter.getAllExercisesByDayOfWeek(day_of_week, workout_id, req.query.type);
            return res.status(200).send(exercises);
        } catch (error) {
            return res.status(400).send({error})
        }
    }
    async getIndividualExercisesByDayOfWeekAsAthlete(req, res) {
        try{
            const athlete_id = req.params.id;
            const { day_of_week } = req.query;
            const exercises = await ExercisesWorkoutAdapter.getAllIndividualExercisesByDayOfWeekAsAthlete(athlete_id, day_of_week);
            return res.status(200).send({exercises});
        } catch(error){
            console.log(error);
            return res.status(400).send({error});
        }
    }
    async getTeamExercisesByDayOfWeekAsAthlete(req, res) {
        try{
            const team_id = req.params.id;
            const { day_of_week } = req.query;
            const exercises = await ExercisesWorkoutAdapter.getAllTeamExercisesByDayOfWeekAsAthlete(team_id, day_of_week);
            return res.status(200).send({exercises});
        } catch(error){
            return res.status(400).send({error});
        }
    }
    async removeExercise(req, res){
        try {
            const exercise_id = req.params.id;
            await ExercisesWorkoutAdapter.removeExercise(exercise_id);
            return res.status(200).send();
        } catch(error){
            return res.status(400).send({error});
        }
    }
}

module.exports = new ManageExercisesController();