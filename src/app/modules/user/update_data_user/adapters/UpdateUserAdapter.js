const { User } = require("../../../../models");
class UpdateDataUserAdapter {
    async update(data, user_id) {
        try {
            await User.update({ data }, { where: { id: user_id } });
            return;
        } catch (error) {
            throw error;
        }
    }
}

module.exports = new UpdateDataUserAdapter();