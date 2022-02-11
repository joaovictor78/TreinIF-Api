const registerValidation = require("../validations/register_validations");
const GenerateTokenProvider = require("../../_provider/GenereteTokenProvider");
const GenereteRefreshTokenProvider = require("../../_provider/GenereteRefreshTokenProvider");
const RolesEnum = require("../../../../utils/roles_enum");
class RegisterUserUseCase {
  constructor(userAdapter, athleteDataAdapter) {
    this.userAdapter = userAdapter;
    this.athleteDataAdapter = athleteDataAdapter;
  }
  async create(user) {
    this.user = user;
    try {
      registerValidation(this.user);
      const user = await this.userAdapter.register(this.user);
      if (user === null) {
        throw "User already exists!"
      }
      const acess_token = GenerateTokenProvider.execute(user.id, user.role_id );
      const refresh_token = await GenereteRefreshTokenProvider.execute(user.id);
      console.log(user.id);
      if (user.role_id == RolesEnum.Athlete) {
        const { blood_type, birth_date, CPF, RG, course_id, role_id } = this.user;
        const athleteDataDTO = { blood_type, birth_date, CPF, RG, course_id, role_id, user_id: user.id };
        const athleteData = await this.athleteDataAdapter.registerAthleteData(athleteDataDTO);
        const userDTO = Object.assign(user, athleteData);
        return { user: userDTO, token: { acess_token, refresh_token } };
      } else {
        return { user, token: { acess_token, refresh_token } };
      }
    } catch (e) {
      console.log(e);
      throw e;
    }
  }
}
module.exports = RegisterUserUseCase; 