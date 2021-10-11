const GetUser = require("../authenticate_user/adapters/AuthenticateUserAdapter");
const UpdateRefreshTokenAdapter = require("../reset_password_user/adapters/update_refresh_token_adapter");
const crypto = require("crypto");
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
                const code = crypto.randomBytes(2).toString("hex").toUpperCase();
                const expireIn = dayjs().add(30, 'minute').unix();
                const refreshPasswordToken = jwt.sign({ code, expireIn }, process.env.APP_SECRET, { expiresIn: dayjs().add(1, "hour").unix() });
                const token = await  UpdateRefreshTokenAdapter.getAndUpdateUser(email, refreshPasswordToken);
                console.log(token, refreshPasswordToken, expireIn);
                mailer.sendMail({
                    to: email,
                    from: "joaovictorb.dasilva2003@gmail.com",
                template: '/forgot_password_template',
            context: {token}});
            res.send();
            }
        } catch (e) {
            console.log(e);
            res.status(400).send({ erro: 'Erro on forgot password, try again' });
        }
    }
}
module.exports = new ResetPasswordUserController(); 