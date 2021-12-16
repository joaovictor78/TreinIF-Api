const { AthleteData } = require("../../../models")
class RegisterAthleteSupplementaryDataAdapter {
    async registerAthleteData(data) {
        try {
            const result = await AthleteData.create(data);
            const { birth_date, blood_type, CPF, RG, course_id } = result;
            return { birth_date, blood_type, CPF, RG, course_id };
        } catch (e) {
            console.log(e);
        }
    }
}
module.exports = new RegisterAthleteSupplementaryDataAdapter;