const { User } = require("../../../../models");
const { AthleteData } = require("../../../../models");
const RolesEnum = require("../../../../utils/roles_enum")
class AuthenticateUserAdapter{
    async getUser(email){
        try{
            console.log(email);
            const {id, full_name, avatar_url, role_id, password_hash} = await User.findOne( {where: {email} });
            console.log("adsfasdf", role_id)
            if(role_id == RolesEnum.Athlete){
                const { id:athlete_id, birth_date, blood_type, CPF, RG, course_id } = await AthleteData.findOne({where: {user_id: id}});
                return {id, athlete_id, full_name, email, avatar_url, role_id, password_hash, birth_date, blood_type, CPF, RG, course_id }
            }
            return {id, full_name, email, avatar_url, role_id, password_hash};
        } catch(error){
            console.log(error);
            throw error;
        }
      
    } 

}
module.exports = new AuthenticateUserAdapter();