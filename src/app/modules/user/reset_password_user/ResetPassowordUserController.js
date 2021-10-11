const GetUser = require("../authenticate_user/adapters/AuthenticateUserAdapter");
const UpdateRefreshTokenAdapter = require("../reset_password_user/adapters/update_refresh_token_adapter");
const UpdatePasswordHashAdapter = require("../reset_password_user/adapters/update_refresh_token_adapter");
const crypto = require("crypto");
const bcrypt = require("bcrypt");
const dayjs = require("dayjs");
const jwt = require("jsonwebtoken");
const mailer = require("../../../../externals/mailer");
class ResetPasswordUserController {
    async forgotPassword(req, res) {
        const { email } = req.body;
        try {
            const user = await GetUser.getUser(email);
            if (!user) {
                return res.status(400).send({ error: "User not found" });
            } else {
                const refreshPasswordToken = crypto.randomBytes(2).toString("hex").toUpperCase();
                const expireIn = dayjs().add(30, 'minute').unix();
                const token = await  UpdateRefreshTokenAdapter.getAndUpdateUser(email, refreshPasswordToken);
                console.log(refreshPasswordToken, token, expireIn);
                mailer.sendMail({
                    to: email,
                    from: "joaovictorb.dasilva2003@gmail.com",
                template: '/forgot_password_template',
            context: {token}});
            res.send({message: "Token to reset password received successfully!"});
            }
        } catch (e) {
            console.log(e);
            res.status(400).send({ erro: 'Erro on forgot password, try again' });
        }
    }
    async resetPassword(req, res){
       const { password_reset_token, new_password } = req.body;
       const user = await GetUser.getUser(email);
       if(user.password_reset_token === password_reset_token){
         const newPasswordHash = await bcrypt.hash(new_password, 8);
         UpdatePasswordHashAdapter.updateByToken(email, refreshPasswordToken);
       }
        
    }
}
module.exports = new ResetPasswordUserController(); 