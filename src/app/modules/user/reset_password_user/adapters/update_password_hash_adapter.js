const { User } = require("../../../../models");
class UpdatePasswordHashAdapter{
    async updateByToken(email, newPasswordHash){
        const user = await User.update( {password_hash: newPasswordHash }, { where: { email }});
        return user;
    }
}
module.exports = new UpdatePasswordHashAdapter();