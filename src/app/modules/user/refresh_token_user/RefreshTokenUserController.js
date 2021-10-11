const RefreshTokenUseCase = require("./usecases/refresh_token_usecase");
const dayjs = require("dayjs");
class RefreshTokenUserController{
    async refreshToken(req, res){
        try{
        const { refresh_token } = req.body;
        if(refresh_token == undefined){
           return res.status(400).send({message: "Required param {token} "});
        }
        if(!dayjs().isAfter(dayjs().unix(refresh_token.expire_in))){
           return res.status(400).send("Expired token");
        } 
      const acess_token = await RefreshTokenUseCase.execute(refresh_token);
      return res.send(acess_token);
    } catch(e){
         console.log(e);
    }
    }
}

module.exports = new RefreshTokenUserController();