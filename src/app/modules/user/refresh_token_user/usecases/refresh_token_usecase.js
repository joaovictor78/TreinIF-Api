const RefreshToken = require("../../_provider/GenereteTokenProvider");
const { Roles } = require("../../../../models");
const jwt = require("jsonwebtoken");
class RefreshTokenUseCase {

   async execute(refresh_token) {
        try {
            const refreshToken = jwt.verify(refresh_token, process.env.APP_JWTSECRET);
            console.log(refreshToken.userId);
            const userRole = await Roles.findOne({ where: { user_id: refreshToken.userId }});
            console.log(userRole);
            const acess_token = RefreshToken.execute(refreshToken.userId,  userRole.role);
            console.log("foi pra ca");
            console.log(acess_token);
            return acess_token;
        } catch (e) {
            console.log(e);
            throw "Invalid token!";
        }
    }

}
module.exports = new RefreshTokenUseCase();