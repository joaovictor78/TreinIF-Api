const { User } = require("../../../../models");
class AuthenticateUserAdapter{
    async getUser(email){
        const {id, full_name, avatar_url, role_id, password_hash} = await User.findOne( {where: {email} });
        return {id, full_name, avatar_url, role_id, password_hash};
    }

}
module.exports = new AuthenticateUserAdapter();