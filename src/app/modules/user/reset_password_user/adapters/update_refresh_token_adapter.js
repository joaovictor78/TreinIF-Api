const { User } = require("../../../../models");
class UpdateRefreshTokenAdapter{
    async getAndUpdateUser(email, refreshPasswordToken){
        const user = await User.update( {refresh: refreshPasswordToken }, { where: { email}});
        return user;
    }

}
module.exports = new  UpdateRefreshTokenAdapter();