const RolesEnum = require("../../../utils/roles_enum");
const  UpdateDataUserAdapter = require("./adapters/UpdateUserAdapter"); 
class UpdateDataUserController{
  async updateDataUser(req, res){
      try{
         const { full_name } = req.body;
         const { publicUrl } = req.file;
         const user_id = req.userId;
         const role_id = req.role_id;
         let newDataUser = {};
         let newAthleteData = {};
         let isAthlete = false;
         newDataUser.full_name = full_name;
         newDataUser.avatar_url = publicUrl ?? "";
         if(role_id == RolesEnum.Athlete){
             isAthlete = true;
             const { course_id, CPF, RG, blood_type, birth_date }  = req.body;
             newAthleteData  = { course_id: parseInt(course_id), CPF, RG, blood_type, birth_date };
             await UpdateDataUserAdapter.updateUser(isAthlete,newDataUser, newAthleteData, user_id);

         } 
         if(role_id == RolesEnum.Trainer){
          await UpdateDataUserAdapter.updateUser(isAthlete,newDataUser,{}, user_id);
         }
         return res.status(200).send({message: "Data User updating with success"});
      } catch (error){
         console.log(error);
         return res.status(400).send(error);
      }
  }
}

module.exports = new UpdateDataUserController();