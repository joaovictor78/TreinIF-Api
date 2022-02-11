const { ExercisesWorkout } = require("../../../../models");
const { IndividualWorkouts } = require("../../../../models");
const { TeamWorkouts } = require("../../../../models");
const { DaysOfWeek } = require("../../../../models");
const WorkoutsTypesEnum = require("../../../../utils/workouts_types_enum");
class ExercisesWorkoutAdapter {
    async createExercise(exercise, daysOfWeeks = []) {
        try {
            const exerciseDTO = await ExercisesWorkout.create(exercise);
            console.log(exerciseDTO);
            daysOfWeeks.forEach(async (element) => {
                const [dayOfWeek] = await DaysOfWeek.findOrCreate({ where: { day_of_week: element } });
                dayOfWeek.addExercise(exerciseDTO);
            });
            return;
        } catch (error) {
            throw error;
        }
    }
    async getAllExercisesByDayOfWeek(day_of_week, workout_id, type) {
        const isIndividualWorkout = type == WorkoutsTypesEnum.Individual;
        try {
            const daysOfWeekWithExercises = await DaysOfWeek.findAll({
                attributes: [],
                include: [
                    {
                        association: 'exercises',
                        include: [{ association: 'exercise', attributes: ["id", "name"] }],
                        attributes: ["id", "series_number", "repeat_time_in_seconds", "exercise_variation"], where: { individual_workout_id: isIndividualWorkout ? workout_id : null, team_workout_id: !isIndividualWorkout ? workout_id : null }
                    }
                ],
                where: {
                    day_of_week
                }
            });
            console.log(daysOfWeekWithExercises);
            return daysOfWeekWithExercises.length == 0 ? { exercises: [] } : daysOfWeekWithExercises[0];
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
    async getAllIndividualExercisesByDayOfWeekAsAthlete(athlete_id, day_of_week) {
        try {
            const individualWorkout = await IndividualWorkouts.findOne({
                where: {
                    athlete_id,
                    is_active: true
                }
            });
            if (individualWorkout == null) {
                return [];
            }
            const dayOfWeek = await DaysOfWeek.findOne({ where: { day_of_week } });
            const exercises = await dayOfWeek.getExercises({ where: { individual_workout_id: individualWorkout.id } });
            return exercises;
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
    async getAllTeamExercisesByDayOfWeekAsAthlete(team_id, day_of_week) {
        try {
            const teamWorkout = await TeamWorkouts.findOne({
                where: {
                    team_id,
                    is_active: true
                }
            });
            if (teamWorkout == null) {
                return [];
            }
            const dayOfWeek = await DaysOfWeek.findOne({ where: { day_of_week } });
            if (dayOfWeek == null) {
                return [];
            }
            const exercises = await dayOfWeek.getExercises({ where: { team_workout_id: teamWorkout.id } });
            return exercises;
        } catch (error) {
            throw error;
        }
    }
    async removeExercise(exercise_id) {
        try {
            await ExercisesWorkout.destroy({ where: { id: exercise_id } });
        } catch (error) {
            throw error;
        }
    }
}
module.exports = new ExercisesWorkoutAdapter();