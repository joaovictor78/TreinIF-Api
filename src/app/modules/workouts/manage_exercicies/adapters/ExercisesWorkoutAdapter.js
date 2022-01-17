const { ExercisesWorkout } = require("../../../../models");
const { DaysOfWeek } = require("../../../../models");
const WorkoutsTypesEnum = require("../../../../utils/workouts_types_enum");
class ExercisesWorkoutAdapter {
    async createExercise(exercise, daysOfWeeks = []) {
        try {
            daysOfWeeks.forEach(async (element) => {
                const [ dayOfWeek ] = await DaysOfWeek.findOrCreate({ where: { day_of_week: element } });
                const exerciseDTO = await ExercisesWorkout.create(exercise);
                dayOfWeek.addExercise(exerciseDTO);
            });
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
    async getAllExercisesByDayOfWeek(day_of_week, workout_id, type) {
        const isIndividualWorkout = type == WorkoutsTypesEnum.Individual;
        try {
            const daysOfWeekWithExercises = await DaysOfWeek.findAll({
                attributes:[],
                include: [
                    { association: 'exercises',
                    include: [ {association: 'exercise', attributes: ["id", "name"]} ],
                     attributes: ["id", "series_number", "repeat_time_in_seconds", "exercise_variation"], where: { individual_workout_id: isIndividualWorkout ? workout_id : null, team_workout_id: !isIndividualWorkout ? workout_id : null} }
                ],
                where: {
                    day_of_week
                }
            });
            return daysOfWeekWithExercises[0];
        } catch (error) {
            throw error;
        }
    }
    async removeExercise(exercise_id){
        try{
            await ExercisesWorkout.destroy({ where: { id: exercise_id } });
        } catch(error){
            throw error;
        }
    }
}
module.exports = new ExercisesWorkoutAdapter();