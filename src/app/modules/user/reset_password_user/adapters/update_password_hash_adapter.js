const { PasswordResetToken } = require("../../../../models");
const { User } = require("../../../../models");
class UpdatePasswordHashAdapter {
    async updateByToken(email, newPasswordHash, expiresIn) {
        try {
            const user = await User.findOne({ where: { email } });
            let newResetPasswordToken;
            const getResetPasswordToken = await PasswordResetToken.findOne({ where: { user_id: user.id } });
            console.log("CAIU AQUI NESSA BOSTA");
            console.log(newPasswordHash);
            if (!getResetPasswordToken) {
                newResetPasswordToken = await PasswordResetToken.update({ refresh_token: newPasswordHash }, { where: { user_id: user.id } });
            } else {
                newResetPasswordToken = await PasswordResetToken.create({ refresh_token: newPasswordHash, user_id: user.id, expiresIn });
            }
            return newResetPasswordToken;
        } catch (e) {
            console.log(e);
            console.log("AQUIIII CARAMBAAAAAAAAAAAAAAAAAAAAA");
            throw "Failed to your reset password";
        }
    }
}
module.exports = new UpdatePasswordHashAdapter();