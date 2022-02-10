const routes = require("express").Router();
const multer = require("multer");
const multerConfig = require("../src/config/multer");
const RegisterUserController = require("../src/app/modules/user/register_user/RegisterUserController");
const AuthenticateUserController = require("../src/app/modules/user/authenticate_user/AuthenticateUserController");
const UpdateDataUserController = require("../src/app/modules/user/update_data_user/UpdateDataUserController");
const RefreshTokenController = require("../src/app/modules/user/refresh_token_user/RefreshTokenUserController");
const ResetPasswordUserController = require("../src/app/modules/user/reset_password_user/ResetPassowordUserController");
const IndivualWorkoutsRoutes = require("./routes/manage_individual_workouts");
const TeamWorkoutsRoutes = require("./routes/manage_workouts_by_teams");
const CoursesRouters = require("./routes/courses");
const AthletesRouters = require("./routes/athletes");
const ModalitiesRouters = require("./routes/modalities");
const TeamsRoutes = require("./routes/teams");
const ExercisesTypesRoutes = require("./routes/exercises_types");
const WorkoutExercisesRoutes = require("./routes/manage_exercises");
const TrainersRoutes = require("./routes/trainers");
const permissions = require("../src/app/middlewares/auth_service"); 
const authMiddleware = require("../src/app/middlewares/auth_middleware");
const route = require("./routes/manage_workouts_by_teams");
routes.use('/login', permissions.acessWithoutToken, AuthenticateUserController.login);
routes.use('/register', permissions.acessWithoutToken, RegisterUserController.register);
routes.use('/refresh-token', permissions.acessWithoutToken,  RefreshTokenController.refreshToken);
routes.use('/forgot-password', permissions.acessWithoutToken, ResetPasswordUserController.forgotPassword);
routes.use('/reset-password', permissions.acessWithoutToken,  ResetPasswordUserController.resetPassword);
routes.use(CoursesRouters);
routes.use(authMiddleware);
routes.use('/update-user-data', multer(multerConfig).single("file"), permissions.allUsers, UpdateDataUserController.updateDataUser);
routes.use(AthletesRouters);
routes.use(TeamsRoutes);
routes.use(ModalitiesRouters);
routes.use(IndivualWorkoutsRoutes);
routes.use(TeamWorkoutsRoutes);
route.use(WorkoutExercisesRoutes);
routes.use("/trainer", ExercisesTypesRoutes);
route.use(TrainersRoutes);
module.exports = routes;