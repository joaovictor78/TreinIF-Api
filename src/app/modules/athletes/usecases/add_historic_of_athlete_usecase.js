const DataPointOfAthleteHistoricAdapter = require("../adapters/DataPointOfAthleteHistoricAdapter");
const ValueDataPointOfAthleteHistoricAdapter = require("../adapters/ValueDataPointOfAthleteHistoricAdapter");
class AddHistoricOfAthleteUseCase {
  async addDataPoint(athlete_id, trainer_id, date) {
    try {
      console.log("IDDDDSSS", athlete_id, trainer_id);
      const { id, createdAt } = await DataPointOfAthleteHistoricAdapter.createDataPoint(athlete_id, trainer_id, date);
      return { id, createdAt };
    } catch (error) {
      console.log(error);
      throw error;
    }
  }
}

module.exports = new AddHistoricOfAthleteUseCase();