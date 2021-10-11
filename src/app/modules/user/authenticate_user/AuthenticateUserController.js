const AuthenticateUserUseCase = require("../authenticate_user/usercases/AuthenticateUserUseCase");
class AuthenticateUserController{
    async login(req, res){
        try{
            const { email, password } = req.body;
            const user = await AuthenticateUserUseCase.auth({email, password});
            return res.send(user);   
        }catch(e){
            return res.status(401).send();
        }
     
    }
}
module.exports = new AuthenticateUserController();