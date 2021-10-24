const jwt = require("jsonwebtoken");
const dayjs = require("dayjs");
class GenerateTokenProvider{
     execute(id, role){
       console.log("foi pra essa porra");
       console.log(id, role);
       return  jwt.sign({ id, role }, process.env.APP_SECRET, { expiresIn: dayjs().add(1, "hour").unix() });
    }
}
module.exports = new GenerateTokenProvider();