const { User } = require("../../../../models");

class RegisterUserAdapter {
    async register(user) {
        try {
            user.role_id = user.role;
            delete user.role;
            const data = await User.create(user);
            const { id, full_name, email, avatar_url, role_id } = data;
            return { id, full_name, email, avatar_url, role_id };
        }
        catch (e) {
            console.log(e);
            throw "There was an error saving the record.";
        }
    }
}

module.exports = RegisterUserAdapter;