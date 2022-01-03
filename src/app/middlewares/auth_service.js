const jwt = require("jsonwebtoken");
const RolesEnum = require("../utils/roles_enum");
function verifyToken(req, res, next){
    const authHeader = req.headers.authorization
    if (!authHeader) {
        return res.status(401).send({ erro: "Token não informado" })
    }
    const parts = authHeader.split(' ')
    if (!parts.length === 2) {
        return res.status(401).send({ erro: "Token não encontrado" })
    }

    const [tipo, token] = parts
    if (!/^Bearer$/i.test(tipo)) {
        res.status(401).send({ erro: 'Token Mal formatado' })
    }
    return token;
}

exports.isAdmin = async (req, res, next) => { 
    const token = verifyToken(req, res, next);
    jwt.verify(token, process.env.APP_SECRET, (err, decoded) => {
        if (err) {
            return res.status(401).send({ erro: "Invalid token" })
        } else{
            if(decoded.role == RolesEnum.Admin){
                req.userId = decoded.id
                return next();
            } else{
                return res.status(401).send({message: "This functionality is restricted to administrators"});
            }
        }
    })
}
exports.isTrainer = async (req, res, next) => { 
    const token = verifyToken(req, res, next);
    jwt.verify(token, process.env.APP_SECRET, (err, decoded) => {
        if (err) {
            return res.status(401).send({ erro: "Invalid token" })
        } else{
            console.log("Role aqui:", decoded.role);
            if(decoded.role == RolesEnum.Trainer){
                req.userId = decoded.id
                return next();
            } else{
                return res.status(401).send({message: "This functionality is restricted to trainers"});
            }
        }
    })
}
