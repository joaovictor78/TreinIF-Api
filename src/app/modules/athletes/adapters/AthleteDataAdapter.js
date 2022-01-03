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
    async searchWithFilter(limit, page, search_term) {
        try {
            const  {count:size, rows:athletes}  = await AthleteData.findAndCountAll({
                include: [
                    {
                        association: 'users',
                        where: {
                            [Op.or]: [

                                {
                                    full_name: {
                                        [Op.iLike]: '%' + search_term + '%'
                                    }
                                },
                                {
                                    email: {
                                        [Op.iLike]:  '%' + search_term + '%'
                                    }
                                }
                            ],


                        }
                    }
                ],
                offset: page * limit,
                limit
            });
            const convertData = athletes.map(obj => {
                const { id, birth_date, blood_type, CPF, RG, user_id } = obj;
                const { full_name, email, avatar_url, role_id} = obj.users
                return { id, full_name, email, avatar_url, role_id,  birth_date, blood_type, CPF, RG, user_id }
            })
            return { size, athletes: convertData };
        } catch (error) {
            throw error;
        }
    }
}
module.exports = new RegisterAthleteSupplementaryDataAdapter;