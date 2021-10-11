const jwt = require('jsonwebtoken')
require('dotenv').config({
    path: process.env.NODE_ENV === 'test' ? '.env.test' : '.env'
});
module.exports = (req, res, next) => {
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

    jwt.verify(token, process.env.APP_SECRET, (err, decoded) => {
        if (err) {
            return res.status(401).send({ erro: "Token invalido" })
        }
        req.userId = decoded.id
        return next()
    })
}