const { AthleteData } = require("../../../../models");

class RegisterAthleteDataAdapter {
    async registerAthleteData(data) {
        try {
            console.log("Register Athlete Data");
            console.log(data);
            const { blood_type, birth_date, CPF, RG, course_id } = await AthleteData.create(data);
            return { blood_type, birth_date, CPF, RG, course_id };
        } catch (e) {
            throw e;
        }
    }
}
module.exports = RegisterAthleteDataAdapter;