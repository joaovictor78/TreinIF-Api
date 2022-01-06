const { AthleteData } = require("../../../models");
const TeamsAdapter = require("../adapters/TeamsAdapter");
const { IndividualWorkouts } = require("../../../models");
const { TeamWorkouts } = require("../../../models");
const { Op } = require("sequelize");
class RegisterAthleteSupplementaryDataAdapter {
    async registerAthleteData(data) {
        try {
            const result = await AthleteData.create(data);
            const { birth_date, blood_type, CPF, RG, course_id } = result;
            return { birth_date, blood_type, CPF, RG, course_id };
        } catch (error) {
            throw error;
        }
    }
    async getAllAthletesByIndividualWorkouts(trainer_id) {
        try {
            const listTeamsIdOfTrainer = await TeamsAdapter.getTeamsID(trainer_id);
            const athletesByIndividualWorkouts = await IndividualWorkouts.findAll({
                where: { trainer_id },
                include: [
                    {
                        required: true, association: 'athlete',
                        attributes: ["id", "birth_date", "blood_type", "CPF", "RG"],
                        include: [
                            { required: true, association: 'users', attributes: ["full_name", "email", "avatar_url"] }
                        ],
                    },
                ]
            });
            const ahtletesByIndividualWorkoutsGroupByTeam = await TeamWorkouts.findAll({
                where: {
                    team_id: listTeamsIdOfTrainer,
                    [Op.not]: [
                        { athlete_id: null }
                    ]
                },
                include: [
                    {
                        required: true, association: 'athlete',
                        attributes: ["id", "birth_date", "blood_type", "CPF", "RG"],
                        include: [
                            { required: true, association: 'users', attributes: ["full_name", "email", "avatar_url"] }
                        ],
                    },
                ]

            });
            const convertAhtletesByIndividualWorkoutsGroupByTeam = ahtletesByIndividualWorkoutsGroupByTeam.map((element) => {
                const { id: athlete_id, birth_date, blood_type, CPF, RG } = element.athlete;
                const { full_name, email, avatar_url } = element.athlete.users;
                return { athlete_id, full_name, email, avatar_url, birth_date, blood_type, CPF, RG }
            });
            const convertAthletesByIndividualWorkoutsData = athletesByIndividualWorkouts.map((element) => {
                const { id: athlete_id, birth_date, blood_type, CPF, RG } = element.athlete;
                const { full_name, email, avatar_url } = element.athlete.users;
                return { athlete_id, full_name, email, avatar_url, birth_date, blood_type, CPF, RG }
            });
            const join = [...convertAthletesByIndividualWorkoutsData, ...convertAhtletesByIndividualWorkoutsGroupByTeam];
            return join;
        } catch (error) {
            console.log(error);
            throw error;
        }
    }
    async searchWithFilter(limit, page, search_term) {
        try {
            const { count: size, rows: athletes } = await AthleteData.findAndCountAll({
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
                                        [Op.iLike]: '%' + search_term + '%'
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
                const { full_name, email, avatar_url, role_id } = obj.users
                return { id, full_name, email, avatar_url, role_id, birth_date, blood_type, CPF, RG, user_id }
            })
            return { size, athletes: convertData };
        } catch (error) {
            throw error;
        }
    }
}
module.exports = new RegisterAthleteSupplementaryDataAdapter;