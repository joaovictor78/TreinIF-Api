const { User } = require("../../../../models");
const { Roles } = require("../../../../models");
class RegisterUserAdapter {
    async register(user) {
        try {
            const data = await User.create(user);
            const { id, full_name, email, avatar_url } = data;
            const role = await Roles.create({user_id: id});
            console.log(role);
            return { id, full_name, email, avatar_url, role };
        }
        catch (e) {
            return null;
        }
    }
}

module.exports = RegisterUserAdapter;