const DataPointOfAthleteHistoricAdapter = require("../adapters/DataPointOfAthleteHistoricAdapter");
const ValueDataPointOfAthleteHistoricAdapter = require("../adapters/ValueDataPointOfAthleteHistoricAdapter");
class AddHistoricOfAthleteUseCase {
  async addDataPoint(athlete_id, trainer_id, data_point_values = []) {
    try {
      console.log("IDDDDSSS", athlete_id, trainer_id);
      const { id } = await DataPointOfAthleteHistoricAdapter.createDataPoint(athlete_id, trainer_id);
      data_point_values.map(async (value) => {
        await ValueDataPointOfAthleteHistoricAdapter.addDataPointValue(value, id);
      });
    } catch (error) {
      console.log(error);
      throw error;
    }
  }
}

module.exports = new AddHistoricOfAthleteUseCase();