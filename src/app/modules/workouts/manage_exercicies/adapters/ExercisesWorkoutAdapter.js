const { ExercisesWorkout } = require("../../../../models");
const { DaysOfWeek } = require("../../../../models");
const WorkoutsTypesEnum = require("../../../../utils/workouts_types_enum");
class ExercisesWorkoutAdapter {
    async createWorkout(exercise, daysOfWeeks = []) {
        try {
            daysOfWeeks.forEach(async (element) => {
                const [ dayOfWeek ] = await DaysOfWeek.findOrCreate({ where: { day_of_week: element } });
                const exerciseDTO = await ExercisesWorkout.create(exercise);
                console.log("aqui",dayOfWeek);
                dayOfWeek.addExercise(exerciseDTO);
            });
        } catch (error) {
            throw error;
        }
    }
    async getAllExercisesByDayOfWeek(day_of_week, workout_id, type) {
        const isIndividualWorkout = type === WorkoutsTypesEnum.Individual;
        try {
            const exercises = await DaysOfWeek.findAll({
                include: [
                    { association: 'exercises', where: { individual_workout_id: isIndividualWorkout ?  workout_id : null, team_workout_id: !isIndividualWorkout ? workout_id : null } }
                ],
                where: {
                    day_of_week
                }
            });
            console.log(exercises)
            return exercises;
        } catch (error) {
            throw error;
        }
    }
}
module.exports = new ExercisesWorkoutAdapter();