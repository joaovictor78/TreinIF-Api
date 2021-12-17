const routes = require("express").Router();
const RegisterUserController = require("../src/app/modules/user/register_user/RegisterUserController");
const AuthenticateUserController = require("../src/app/modules/user/authenticate_user/AuthenticateUserController");
const RefreshTokenController = require("../src/app/modules/user/refresh_token_user/RefreshTokenUserController");
const ResetPasswordUserController = require("../src/app/modules/user/reset_password_user/ResetPassowordUserController");
const CoursesRouters = require("./routes/courses");
const AthletesRouters = require("./routes/athletes");
const permissions = require("../src/app/services/auth_service"); 
const authMiddleware = require("../src/app/middlewares/auth_middleware");
routes.use('/login', AuthenticateUserController.login);
routes.use('/register', RegisterUserController.register);
//routes.use(authMiddleware);
routes.use('/refresh-token', RefreshTokenController.refreshToken);
routes.use('/forgot-password', ResetPasswordUserController.forgotPassword);
routes.use('/reset-password', ResetPasswordUserController.resetPassword);
routes.use(AthletesRouters);
routes.use(CoursesRouters)


module.exports = routes;