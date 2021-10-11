const routes = require("express").Router();
const RegisterUserController = require("../src/app/modules/user/register_user/RegisterUserController");
const AuthenticateUserController = require("../src/app/modules/user/authenticate_user/AuthenticateUserController");
const RefreshTokenController = require("../src/app/modules/user/refresh_token_user/RefreshTokenUserController");
const ResetPasswordUserController = require("../src/app/modules/user/reset_password_user/ResetPassowordUserController")
const permissions = require("../src/app/services/auth_service"); 
const OperatorRoutes = require("./routes/operators");
routes.use('/login', AuthenticateUserController.login);
routes.use('/register-user', RegisterUserController.register);
routes.use('/refresh-token', RefreshTokenController.refreshToken);
routes.use('/forgot-password', ResetPasswordUserController.forgotPassword);
routes.use('/order', permissions.isAdmin, OperatorRoutes);

module.exports = routes;