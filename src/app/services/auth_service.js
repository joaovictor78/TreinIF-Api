const jwt = require("jsonwebtoken");

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
            return res.status(401).send({ erro: "Token invalido" })
        } else{
            if(decoded.role == "admin"){
                req.userId = decoded.id
                return next();
            } else{
                return res.status(401).send({message: "This functionality is restricted to administrators"});
            }
        }
    })
}
