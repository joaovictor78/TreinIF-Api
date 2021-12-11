const createUserAdapter = require("../register_user/adapters/RegisterUserAdapter");
const createUserUseCase = require("../register_user/usercases/register_user_usecase");
class RegisterUserController {
    async register(req, res) {
        const createUser = new createUserUseCase(new createUserAdapter());
        const params = ["full_name", "email", "avatar_url", "is_free_plan", "password"];
        for (let index in Object.keys(req.body)) {
            if (!Object.keys(req.body).includes(params[index])) {
                return res.status(400).json({ message: `Invalid params: ${params[index]} cannot be accepted or cannot null` });
            }
        }
        try{
            const user = await createUser.create(req.body);
            return res.send(user);
        } catch (e){
            return res.status(400).send({message:  e});
        }  
    }
}
module.exports = new RegisterUserController();