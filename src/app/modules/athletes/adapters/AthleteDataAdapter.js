const { AthleteData } = require("../../../models");
const { Op } = require("sequelize");
class RegisterAthleteSupplementaryDataAdapter {
    async registerAthleteData(data) {
        try {
            const result = await AthleteData.create(data);
            const { birth_date, blood_type, CPF, RG, course_id } = result;
            return { birth_date, blood_type, CPF, RG, course_id };
        } catch (error) {
            console.log(error);
        }
    }
    async searchWithFilter(limit, page, full_name, email) {
        try {
            const  {count:size, rows:athletes}  = await AthleteData.findAndCountAll({
                include: [
                    {
                        association: 'users',
                        where: {
                            [Op.or]: [

                                {
                                    full_name: {
                                        [Op.iLike]: '%' + full_name + '%'
                                    }
                                },
                                {
                                    email: {
                                        [Op.iLike]:  '%' + email + '%'
                                    }
                                }
                            ],


                        }
                    }
                ],
                offset: page * limit,
                limit
            });
            return { size, athletes };
        } catch (error) {
            throw error;
        }
    }
}
module.exports = new RegisterAthleteSupplementaryDataAdapter;