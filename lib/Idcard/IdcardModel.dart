class IdcardModel {
  String? status;
  Data? data;

  IdcardModel({this.status, this.data});

  IdcardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? level;
  String? avatar;
  String? studentId;
  String? sId;
  String? token;
  int? iV;

  Data({this.level, this.avatar, this.studentId, this.sId, this.token, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    avatar = json['avatar'];
    studentId = json['studentId'];
    sId = json['_id'];
    token = json['token'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['avatar'] = avatar;
    data['studentId'] = studentId;
    data['_id'] = sId;
    data['token'] = token;
    data['__v'] = iV;
    return data;
  }
}
