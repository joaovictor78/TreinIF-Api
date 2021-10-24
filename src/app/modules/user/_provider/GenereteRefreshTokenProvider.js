const dayjs = require("dayjs");
const { RefreshToken } = require("../../../models");
const jwt = require("jsonwebtoken");
class GenerateRefreshTokenProvider {
    async execute(userId) {
        try {
            const haveRefreshToken = await RefreshToken.findOne({ where: { user_id: userId } });
            if(haveRefreshToken !== null) {
                await RefreshToken.destroy({ where: { user_id: userId } });
            }    
            const expireIn = dayjs().add(1, "month").unix();
            const refreshToken = jwt.sign({ userId, expireIn }, process.env.APP_JWTSECRET, { expiresIn: expireIn });
            const generateRefreshToken = await RefreshToken.create({
                user_id: userId,
                refresh_token: refreshToken,
                expire_in: expireIn
            });
            return generateRefreshToken.refresh_token;
        } catch (e) {
            console.log(e);
            throw e;
        }
    }
}
module.exports = new GenerateRefreshTokenProvider();
