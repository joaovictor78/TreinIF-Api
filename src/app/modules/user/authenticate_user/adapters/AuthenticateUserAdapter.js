const { User } = require("../../../../models");
class AuthenticateUserAdapter{
    async getUser(email){
        const user = await User.findOne( {where: {email} });
        return user;
    }

}
module.exports = new AuthenticateUserAdapter();