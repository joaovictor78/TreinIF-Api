const { ExerciseTypes } = require("../../../models");
class ExercisesTypesAdapter {
    async createExerciseType(data) {
        try {
            await ExerciseTypes.create(data);
        } catch (error) {
            throw error;
        }
    }
    async getAllExercisesTypes(trainer_id) {
        try {
            const exercisesTypes = await ExerciseTypes.findAll({ where: { trainer_id } });
            return exercisesTypes;
        } catch (error) {
            throw error;
        }

    }
}
module.exports = new ExercisesTypesAdapter;