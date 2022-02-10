const { IndividualWorkouts } = require("../../../models");
const { AthleteData } = require("../../../models");
class GetAllTrainersByIndividualWorkoutsAdapter{
   async getAllTrainers(user_id){
       try {
            const {  id:athlete_id } = await AthleteData.findOne({ where: { user_id }, attributes: ["id"] });
            const trainersByIndividualWorkouts = await IndividualWorkouts.findAll({
            where: { athlete_id },
            include: [
                {
                    required: true,
                    association: 'trainer'
                },
            ]
        });
    
        const convertTrainersByIndividualWorkoutsData = trainersByIndividualWorkouts.map((element) => {
            const { id, full_name, email} = element.trainer;
            return { id, full_name, email};
        });
        
        return convertTrainersByIndividualWorkoutsData;
       } catch(error){
           console.log(error);
           throw error;
       }
   }   
}

module.exports = new GetAllTrainersByIndividualWorkoutsAdapter();