class RegisterModel {
  String? status;
  Data? data;

  RegisterModel({this.status, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? password;
  String? gmail;
  String? role;
  String? address;
  String? phone;
  String? dateOfBirth;
  String? gender;
  String? sId;
  String? token;
  int? iV;

  Data(
      {this.name,
        this.email,
        this.password,
        this.gmail,
        this.role,
        this.address,
        this.phone,
        this.dateOfBirth,
        this.gender,
        this.sId,
        this.token,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    gmail = json['gmail'];
    role = json['role'];
    address = json['address'];
    phone = json['phone'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    sId = json['_id'];
    token = json['token'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['gmail'] = this.gmail;
    data['role'] = this.role;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['dateOfBirth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['_id'] = this.sId;
    data['token'] = this.token;
    data['__v'] = this.iV;
    return data;
  }
}