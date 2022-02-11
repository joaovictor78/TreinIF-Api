import '/app/modules/start/submodules/workouts/domain/entitities/code_entitiy.dart';

class CodeDTO extends CodeEntity {
  int? codeId;
  String? code;

  CodeDTO({this.codeId, this.code}) : super(codeId: codeId, code: code);

  CodeDTO.fromJson(Map<String, dynamic> json) {
    codeId = json['id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.codeId;
    data['code'] = this.code;
    return data;
  }
}
