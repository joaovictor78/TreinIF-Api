const { User } = require("../../../../models");
class UpdatePassword{
  async updatePassowrd(email, newPasswordHash){
      try{
          await User.update({ password_hash:  newPasswordHash }, { where: { email }});
      }catch (e){
          throw "Error changed password failed";
      }
  }
}
module.exports = new UpdatePassword();