const RefreshToken = require("../../_provider/GenereteTokenProvider");
const jwt = require("jsonwebtoken");
class RefreshTokenUseCase{
    async execute(refresh_token){
        let acess_token; 
        jwt.verify(refresh_token, process.env.APP_JWTSECRET, (err, decoded) => {
            if (err) {
                return "Token invalido!";
            }
            acess_token = RefreshToken.execute(decoded.id);
        });
        return acess_token;
    }
}
module.exports = new RefreshTokenUseCase();