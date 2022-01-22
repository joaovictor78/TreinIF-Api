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
            const exercisesTypes = await ExerciseTypes.findAll({ where: { trainer_id }, attributes: ["id", "name"] });
            return exercisesTypes;
        } catch (error) {
            throw error;
        }
    }
    async updateExerciseType(exerciseTypeID, exerciseTypeName) {
        try {
            await ExerciseTypes.update({ name: exerciseTypeName }, { where: { id: exerciseTypeID } });
            return;
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
    async removeExerciseType(exerciseTypeID) {
        try {
            await ExerciseTypes.destroy({ where: { id: exerciseTypeID } });
        } catch (error) {
            throw error;
        }

    }
}
module.exports = new ExercisesTypesAdapter;