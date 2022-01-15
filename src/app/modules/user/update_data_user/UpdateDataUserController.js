const  UpdateDataUserAdapter = require("./adapters/UpdateUserAdapter"); 
class UpdateDataUserController{
  async updateDataUser(req, res){
      try{
         const user_id = req.params.id;
         const data = req.body;
         await UpdateDataUserAdapter.update(data, user_id);
         return res.status(200).send({message: "Data User updating with success"});
      } catch (error){
         return res.status(400).send(error);
      }
  }
}

module.exports = new UpdateDataUserController();