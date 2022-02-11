const { AthleteData } = require("../../../../models");

class RegisterAthleteDataAdapter {
    async registerAthleteData(data) {
        try {
            console.log("Register Athlete Data");
            console.log(data);
            const { id:athlete_id, blood_type, birth_date, CPF, RG, course_id } = await AthleteData.create(data);
            return { athlete_id, blood_type, birth_date, CPF, RG, course_id };
        } catch (e) {
            throw e;
        }
    }
}
module.exports = RegisterAthleteDataAdapter;