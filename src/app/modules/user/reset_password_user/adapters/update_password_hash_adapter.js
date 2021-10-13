const { PasswordResetToken } = require("../../../../models");
class UpdatePasswordHashAdapter{
    async updateByToken(email, newPasswordHash){
        const user = await PasswordResetToken.update( {password_hash: newPasswordHash }, { where: { email }});
        return user;
    }
}
module.exports = new UpdatePasswordHashAdapter();