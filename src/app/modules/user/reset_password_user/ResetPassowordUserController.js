const GetUser = require("../authenticate_user/adapters/AuthenticateUserAdapter");
const UpdateRefreshTokenAdapter = require("../reset_password_user/adapters/update_refresh_token_adapter");
const UpdatePasswordHashAdapter = require("../reset_password_user/adapters/update_password_hash_adapter");
const crypto = require("crypto");
const bcrypt = require("bcrypt");
const dayjs = require("dayjs");
const jwt = require("jsonwebtoken");
const mailer = require("../../../../externals/mailer");
require('dotenv').config({
    path: process.env.NODE_ENV === 'test' ? '.env.test' : '.env'
});
class ResetPasswordUserController {
    async forgotPassword(req, res) {
        const { email } = req.body;
        try {
            const user = await GetUser.getUser(email);
            if (!user) {
                return res.status(400).send({ error: "User not found" });
            } else {
                const code = crypto.randomBytes(2).toString("hex").toUpperCase();
                const expireIn = dayjs().add(30, 'minute').unix();
                const refreshPasswordToken = await UpdateRefreshTokenAdapter.getAndUpdateUser(email, token);
                console.log(refreshPasswordToken, token, code);
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
        let email = "";
        jwt.verify(password_reset_token, process.env.APP_SECRET, (err, decoded) => {
            if (err) {
                return res.status(401).send({ erro: "Token invalido" })
            }
            email = decoded.email;
        });
        const user = await GetUser.getUser(email);
        if (user.password_reset_token === password_reset_token) {
            const newPasswordHash = await bcrypt.hash(new_password, 8);
            UpdatePasswordHashAdapter.updateByToken(email, newPasswordHash);
        }

    }
}
module.exports = new ResetPasswordUserController();