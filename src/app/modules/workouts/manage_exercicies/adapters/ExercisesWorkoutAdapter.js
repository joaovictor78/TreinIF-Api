const { ExercisesWorkout } = require("../../../../models");
const { DaysOfWeek } = require("../../../../models")
class ExercisesWorkoutAdapter {
    async createWorkout(exercise, daysOfWeeks = []) {
        try {
            daysOfWeeks.forEach(async (element) => {
                const dayOfWeek = await DaysOfWeek.findOrCreate({ where: { day_of_week: element } });
                console.log("funcionou", dayOfWeek);
                console.log(exercise);
                const exerciseDTO = await ExercisesWorkout.create(exercise);
                dayOfWeek.addExercisesWorkout(exerciseDTO);
            });
        } catch (error) {
            throw error;
        }
    }
}
module.exports = new ExercisesWorkoutAdapter();