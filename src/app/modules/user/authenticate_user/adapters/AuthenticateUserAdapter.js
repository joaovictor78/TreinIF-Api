const { User } = require("../../../../models");
const { AthleteData } = require("../../../../models");
const RolesEnum = require("../../../../utils/roles_enum")
class AuthenticateUserAdapter{
    async getUser(email){
        const {id, full_name, avatar_url, role_id, password_hash} = await User.findOne( {where: {email} });
        if(role_id == RolesEnum.Athlete){
            const { birth_date, blood_type, CPF, RG, course_id } = await AthleteData.findOne({where: {user_id: id}});
            return {id, full_name, email, avatar_url, role_id, password_hash, birth_date, blood_type, CPF, RG, course_id }
        }
        return {id, full_name, email, avatar_url, role_id, password_hash};
    } 

}
module.exports = new AuthenticateUserAdapter();