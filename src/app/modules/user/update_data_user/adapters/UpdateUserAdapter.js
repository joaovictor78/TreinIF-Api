const { User } = require("../../../../models");
const { AthleteData } = require("../../../../models");
class UpdateDataUserAdapter {
    async updateUser(isAtlete=false, new_user_data, new_athlete_data, user_id) {
        try {
            await User.update({ ...new_user_data }, { where: { id: user_id } });
            if(isAtlete){
                await AthleteData.update({ ...new_athlete_data }, { where: { user_id }});
            }
            return;
        } catch (error) {
            console.log(error)
            throw error;
        }
    }
}

module.exports = new UpdateDataUserAdapter();