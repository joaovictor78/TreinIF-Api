const { RefreshToken } = require("../../../../models");
class RefreshTOkenAdapter{
    execute(refresh_token){
        const refreshToken = RefreshToken.findOne({ where: { refresh_token } });
        return refreshToken;
    }
}

module.exports = new RefreshTOkenAdapter();