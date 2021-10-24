const GetUser = require("../authenticate_user/adapters/AuthenticateUserAdapter");
const UpdateTokenResetPasswordAdapter = require("../reset_password_user/adapters/update_token_reset_password_adapter");
const GetTokenResetPasswordAdapter = require("../reset_password_user/adapters/get_token_reset_password_adapter");
const UpdatePasswordAdapter = require("../reset_password_user/adapters/update_password_adapter");
const { PasswordResetToken } = require("../../../models");
const crypto = require("crypto");
const bcrypt = require("bcrypt");
const dayjs = require("dayjs");
const jwt = require("jsonwebtoken");
const mailer = require("../../../../externals/mailer");

class ResetPasswordUserController {
    async forgotPassword(req, res) {
        const { email } = req.body;
        const user = await GetUser.getUser(email);
        try {
            if (!user) {
                return res.status(400).send({ error: "User not found" });
            } else {
                const code = crypto.randomBytes(2).toString("hex").toUpperCase();
                const expireIn = dayjs().add(30, 'minute').unix();
                await UpdateTokenResetPasswordAdapter.updateOrCreateTokenResetPassword(user.id, code, expireIn);
                mailer.sendMail({
                    to: email,
                    from: "joaovictorb.dasilva2003@gmail.com",
                    template: '/forgot_password_template',
                    context: { code }
                });
                res.send({ message: "Token to reset password received successfully!" });
            }
        } catch (e) {
            console.log(e);
            res.status(400).send({ erro: 'Erro on forgot password, try again' });
        }
    }
    async resetPassword(req, res) {
        const { password_reset_token, new_password, email } = req.body;
        const user = await GetUser.getUser(email);
        const token =  await  GetTokenResetPasswordAdapter.getTokenResetPassword(user.id);
        if(!token){
            return res.status(401).send({ message: "Invalid token" });
        }
        if(!dayjs().isAfter(dayjs().unix(token.expire_in))){
            return res.status(404).send("Expired code");
         } 
        if (token.password_reset_token === password_reset_token) {
            const newPasswordHash = await bcrypt.hash(new_password, 8);
            await UpdatePasswordAdapter.updatePassowrd(user.email, newPasswordHash);
            await PasswordResetToken.destroy({ where: { user_id: user.id}});
            res.send({message: "Password changed successfully"});
        } else{
            res.status(404).send({error: "code invalid"});
        }

    }
}
module.exports = new ResetPasswordUserController();