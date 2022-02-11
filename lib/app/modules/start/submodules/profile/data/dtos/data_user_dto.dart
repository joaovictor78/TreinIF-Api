import '/app/core/enums/user_types_enum.dart';
import '/app/core/models/logged_user_po.dart';

import '/app/modules/start/submodules/profile/domain/entities/user_entity.dart';

class DataUserDto{
  UserEntity? user;
  DataUserDto({this.user});
  Map<String, dynamic> toMap(){
      Map<String, dynamic> data = {};
      data["full_name"] = user!.fullName;
      if(LoggedUserPO.logeedUser!.user!.userType == UserTypesEnum.athlete){
        data["course_id"] = user!.athleteEntity!.course_id;
        data["birth_date"] = user!.athleteEntity!.birth_date;
        data["blood_type"] = user!.athleteEntity!.blood_type;
        data["CPF"] = user!.athleteEntity!.cpf;
        data["RG"] = user!.athleteEntity!.rg;
      } 
    return data;
  }
}