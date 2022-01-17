const { DataPointOfAthleteHistoric } = require("../../../models");
class DataPointOfAthleteHistoricAdapter {
    async createDataPoint(athlete_id, trainer_id) {
        try {
            console.log("UUUUUU", athlete_id, trainer_id);
            const data_point = await DataPointOfAthleteHistoric.create({ athlete_id, trainer_id });
            return data_point;
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
    async removeDataPointOfAthlete(data_point_id) {
        try{
            await DataPointOfAthleteHistoric.destroy({where: { id: data_point_id }});
            return;
        } catch(error){
            throw error;
        }
    }
    async getAllDataPointOfAthlete(athlete_id, trainer_id) {
        try {
            const data_points = await DataPointOfAthleteHistoric.findAll(
                {
                    where: {
                        athlete_id,
                        trainer_id
                    },
                    attributes: ["id", "createdAt"],
                    include: [
                        {
                            association: "values_data_point",
                            attributes: ["id", "type", "value"]
                           
                        }
                    ]
                }
            );
            return data_points;
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
}

module.exports = new DataPointOfAthleteHistoricAdapter();