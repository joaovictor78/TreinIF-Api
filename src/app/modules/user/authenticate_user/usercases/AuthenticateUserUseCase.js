const AuthenticateUserAdapter = require("../adapters/AuthenticateUserAdapter");
const bcrypt = require("bcrypt");
const GenerateTokenProvider = require("../../../../modules/user/_provider/GenereteTokenProvider");
const GenerateRefreshTokenProvider = require("../../../../modules/user/_provider/GenereteRefreshTokenProvider");
class AuthenticateUserUseCase{
    async auth(user_credentials){
        try{
         
            const user = await AuthenticateUserAdapter.getUser(user_credentials.email);
            console.log(user);
            if(!user){
                throw { message: "Email or password invalid"};
            }
            if(!await bcrypt.compare(user_credentials.password, user.password_hash)){
                throw { message: "Email or password invalid" };
            }
           
            const acess_token = GenerateTokenProvider.execute(user.id, user.role_id);
            const refresh_token = await GenerateRefreshTokenProvider.execute(user.id);
            delete user.password_hash;
            return {user, token: {acess_token, refresh_token}};
        } catch(e){
            console.log(e);
            throw {message: "Login erro"};
    }
}
}
      


module.exports = new AuthenticateUserUseCase();