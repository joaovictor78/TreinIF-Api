const { AthleteData } = require("../../../models")
class RegisterAthleteSupplementaryDataAdapter {
    async registerAthleteData(data) {
        try {
            const result = await AthleteData.create(data);
            console.log(result);
        } catch (e) {
            console.log(e);
        }
    }
}
module.exports = new RegisterAthleteSupplementaryDataAdapter;