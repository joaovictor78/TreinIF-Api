const { PasswordResetToken } = require("../../../../models");

class GetTokenResetPasswordAdapter{
    async getTokenResetPassword(user_id) {
        try{
            const tokenResetPassword = await PasswordResetToken.findOne({ where: { user_id }});
            return tokenResetPassword;
        } catch (e){
            throw "Error to get Token Reset Password";
        } 
    }
}
module.exports = new GetTokenResetPasswordAdapter();