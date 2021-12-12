const registerValidation = require("../validations/register_validations");
const GenerateTokenProvider = require("../../_provider/GenereteTokenProvider");
const GenereteRefreshTokenProvider = require("../../_provider/GenereteRefreshTokenProvider");
const RolesEnum = require("../../../../utils/roles_enum");

class RegisterUserUseCase {
  constructor(userAdapter) {
    this.userAdapter = userAdapter;
  }
  async create(user) {
    this.user = user;
    try {
      registerValidation(this.user);
      const user = await this.userAdapter.register(this.user);
      if (user === null) {
        throw "User already exists!"
      }
      const acess_token = GenerateTokenProvider.execute({ id: user.id, role: user.role });
      const refresh_token = await GenereteRefreshTokenProvider.execute(user.id);

      return { user, token: { acess_token, refresh_token } };
    } catch (e) {
      console.log(e);
      throw e;
    }
  }
}
module.exports = RegisterUserUseCase;