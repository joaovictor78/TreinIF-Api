const { PasswordResetToken } = require("../../../../models");
class UpdateTokenResetPassword {
    async updateOrCreateTokenResetPassword(user_id, refreshPasswordToken, expiresIn) {
        console.log(refreshPasswordToken)
        console.log(user_id);
        try {
            let newResetPasswordToken = undefined;
            console.log(user_id)
            const getResetPasswordToken = await PasswordResetToken.findOne({ where: { user_id } });
            console.log(getResetPasswordToken)
            if (!!getResetPasswordToken) {
                newResetPasswordToken = await PasswordResetToken.update({ password_reset_token: refreshPasswordToken, expire_in: expiresIn }, { where: { user_id } });
            } else {
                newResetPasswordToken = await PasswordResetToken.create({ password_reset_token: refreshPasswordToken, user_id, expire_in: expiresIn });
            }
            return newResetPasswordToken;
        } catch (e) {
            console.log(e);
            throw "Error generating code to reset password";
        }

    }

}
module.exports = new UpdateTokenResetPassword();