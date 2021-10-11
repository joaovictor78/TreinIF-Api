const AuthenticateUserAdapter = require("../adapters/AuthenticateUserAdapter");
const bcrypt = require("bcrypt");
const GenerateTokenProvider = require("../../../../modules/user/_provider/GenereteTokenProvider");
const GenerateRefreshTokenProvider = require("../../../../modules/user/_provider/GenereteRefreshTokenProvider");
class AuthenticateUserUseCase{
    async auth(user_credentials){
        try{
            const user = await AuthenticateUserAdapter.getUser(user_credentials.email);
            if(!user){
                return { message: "Email or password invalid"};
            }
            if(!await bcrypt.compare(user_credentials.password, user.password_hash)){
                return { message: "Email or password invalid" };
            }
            const acess_token = GenerateTokenProvider.execute(user.id);
            const refresh_token = await GenerateRefreshTokenProvider.execute(user.id);
            return {user, token: {acess_token, refresh_token}};
        } catch(e){
            throw {message: "Login erro"};
    }
}
}
      


module.exports = new AuthenticateUserUseCase();