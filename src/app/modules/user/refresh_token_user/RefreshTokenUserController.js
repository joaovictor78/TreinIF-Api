const RefreshTokenUseCase = require("./usecases/refresh_token_usecase");
const { RefreshToken } = require("../../../models");
const dayjs = require("dayjs");
const jwt = require("jsonwebtoken");
class RefreshTokenUserController{
    async refreshToken(req, res){
        try{
        const { refresh_token } = req.body;
        if(refresh_token == undefined){
           return res.status(400).send({message: "Required param {refresh_token} "});
        }
        const refreshToken = await RefreshToken.findOne({ where: { refresh_token } });
        if(!refreshToken){
           return res.status(401).send({message: "Invalid token"});
        }
        if(!dayjs().isAfter(dayjs().unix(refreshToken.expire_in))){
         return res.status(401).send({message: "Expired token"});
      } 
      
      const acess_token = await RefreshTokenUseCase.execute(refreshToken.refresh_token);
      return res.send({acess_token: acess_token});
    } catch(e){
       return res.status(401).send({message: e});
    }
    }
}

module.exports = new RefreshTokenUserController();