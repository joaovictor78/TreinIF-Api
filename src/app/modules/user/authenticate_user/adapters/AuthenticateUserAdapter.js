const { User } = require("../../../../models");
class AuthenticateUserAdapter{
    getUser(email){
        const user = User.findOne( {where: {email} });
        return user;
    }

}
module.exports = new AuthenticateUserAdapter();