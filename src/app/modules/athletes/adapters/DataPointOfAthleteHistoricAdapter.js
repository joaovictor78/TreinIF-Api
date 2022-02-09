const { DataPointOfAthleteHistoric } = require("../../../models");
class DataPointOfAthleteHistoricAdapter {
    async createDataPoint(athlete_id, trainer_id, date) {
        try {
            const data_point = await DataPointOfAthleteHistoric.create({ athlete_id, trainer_id, createdAt: date });
            return data_point;
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
    async removeDataPointOfAthlete(data_point_id) {
        try{
            console.log(data_point_id);
            await DataPointOfAthleteHistoric.destroy({where: { id: data_point_id }});
            return;
        } catch(error){
            throw error;
        }
    }
    async updateDateDataPointOfAthlete(date, data_point_id){
        try{
            await DataPointOfAthleteHistoric.update({createdAt:date}, {where: { id:data_point_id } });
            return;
        } catch(error){
            console.log(error);
            throw error;
        }
    }
    async getAllAthletesWithDataPoint(trainer_id){
        try{
            const datapoints = await DataPointOfAthleteHistoric.findAll({where: { 
                trainer_id
            },  include: [
                {
                    association: 'athlete'
                },
            ]});
            const athletes = datapoints.map((element) => {
                const { id, birth_date, blood_type, CPF, RG, user_id, course_id } = element.athlete;
                return { id, birth_date, blood_type, CPF, RG, user_id, course_id };
            });
            return athletes;
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