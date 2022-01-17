const registerUserCase  = require("./usecases/register_athletes_usecase");
const searchAthletesWithFilterUseCase = require("./usecases/search_athletes_whith_filter_usecase");
const getAllAthletesByIndividualWorkoutsUseCase = require("./usecases/get_all_athletes_by_individual_workouts_usecase");
const addHistoricOfAthleteUseCase = require("./usecases/add_historic_of_athlete_usecase");
const addValueDataPointHistoricOfAthleteUseCase = require("./usecases/add_value_data_point_historic_of_athlete_usecase");
const getHistoricOfAthleteUseCase = require("./usecases/get_historic_of_athlete_usecase");
const deleteDataPointOfAthleteUseCase = require("./usecases/delete_data_point_historic_of_athlete_usecase");
const deleteValueDataPointHistoricOfAthleteUseCase = require("./usecases/delete_value_data_point_historic_of_athlete_usecase");
const updateValueDataPointHistoricOfAthleteUseCase = require("./usecases/update_value_data_point_historic_of_athlete_usecase");
const updateDataPointHistoricOfAthleteUseCase = require("./usecases/update_date_data_point_of_historic_of_athlete_usecase");
const AthleteDataAdapter = require("./adapters/AthleteDataAdapter");
class AthletesController{
    async registerSupplementaryData(req, res){
        try{
           const data = req.body;
           const result = await registerUserCase.registerAthleteSupplementaryData(data);
           if(!!result){
               return res.status(200).send({data: result});
           }
        }catch(e){
            console.log(e);
            return res.status(400).send({message: "Occurred one or more errors then created the user"})
          
        }
    }
    async updateSupplementaryData(req, res){
        try{
            const athlete_id = req.params.id;
            const data = req.body;
            await AthleteDataAdapter.updateAthleteData(data, athlete_id);
            return res.status(200).send({message: "Athlete Data updating with success"})
        }catch(error){
            return res.status(400).send(error);
        }
    }
    async getAllAthletesWithFilter(req, res){
        try{
            let { limit = 10, page = 1, search_term } = req.query;
            limit = parseInt(limit);
            page = (parseInt(page) - 1);
            const { size, athletes } = await searchAthletesWithFilterUseCase.searchAthletesWithFilter(limit, page, search_term);
            return res.status(200).send({ size, athletes });
        }catch(e){
            console.log(e);
            return res.status(400).send({message: "An error occurred while making the query."});
        }
    }
    async getAllAthletesByIndividualWorkouts(req, res){
        try{
            const trainer_id = req.userId;
            const athletes = await getAllAthletesByIndividualWorkoutsUseCase.getAllAthletesByIndividualWorkouts(trainer_id); 
            return res.status(200).send({athletes});
        }catch(error){
            console.log(error);
            return res.status(400).send({error});
        }
    }
    async getHistoricOfAthlete(req, res){
        try{
           const athlete_id = req.params.id;
           const trainer_id = req.userId;
           const data_points = await getHistoricOfAthleteUseCase.getHistoricOfAthlete(athlete_id, trainer_id);
           return  res.status(200).send({data_points});
        } catch(error){
            return res.status(400).send({error});
        }
    }
    async addDataPointOfAthlete(req, res){
        try{
            const athlete_id = req.params.id;
            const trainer_id = req.userId;
            const data_points_values = req.body.data_points_values;
            const date = req.body.date;
            await addHistoricOfAthleteUseCase.addDataPoint(athlete_id, trainer_id, data_points_values, date);
            return res.status(200).send();
        } catch(error){
            return res.status(400).send(error);
        }
    }
    async updateDateDataPointOfAthlete(req, res){
        try{
            const data_point_id = req.params.data_point_id;
            const date = req.body.date;
            console.log("chamou", date, data_point_id);
            await updateDataPointHistoricOfAthleteUseCase.updateDate(date, data_point_id);
            return res.status(200).send();
        } catch(error){
            return res.status(400).send(error);
        }
    }
    async removeDataPointOfAthlete(req, res){
        try{
            const data_point_id = req.params.historic_id;
            await deleteDataPointOfAthleteUseCase.removeDataPoint(data_point_id);
            return res.status(200).send();
        } catch(error){
            return res.status(400).send(error);
        }
    }
    async addValueOfDataPointOfAthlete(req, res){
        try{
            console.log("chamouuuu");
           const data_point_id = req.params.data_point_id;
           const{ type, value } = req.body; 
           const value_data_point = await addValueDataPointHistoricOfAthleteUseCase.addValueDataPoint({ type, value }, data_point_id);
           return res.status(200).send(value_data_point);
        }  catch(error){
            return res.status(400).send(error);
        }      
    }
    async updateValueOfDataPointOfAthlete(req, res){
        try{
            const value_data_point_id = req.params.value_data_point_id;
            const data = req.body;
            await updateValueDataPointHistoricOfAthleteUseCase.updateDataPointValue(data, value_data_point_id);
            return res.status(200).send();
        } catch(error){
            return res.status(400).send(error);
        }
    }
    async removeValueOfDataPointOfAthlete(req, res){
        try {
            const value_data_point_id = req.params.value_data_point_id;
            await deleteValueDataPointHistoricOfAthleteUseCase.deleteDataPointValue(value_data_point_id);
            return res.status(200).send();
        } catch(error){
            return res.status(400).send(error);
        }
    }
}

module.exports = new AthletesController();