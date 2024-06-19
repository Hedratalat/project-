

class CertificateModel {
  String? status;
  Data? data;

  CertificateModel({this.status, this.data});

  CertificateModel.fromJson(Map<String, dynamic> json) {
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
  String? certificateType;
  String? imageUrl;
  String? sId;
  String? token;
  int? iV;

  Data(
      {this.name,
        this.certificateType,
        this.imageUrl,
        this.sId,
        this.token,
        this.iV});
  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    certificateType = json['certificateType'];
    imageUrl = json['imageUrl'];
    sId = json['_id'];
    token = json['token'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['certificateType'] = this.certificateType;
    data['imageUrl'] = this.imageUrl;
    data['_id'] = this.sId;
    data['token'] = this.token;
    data['__v'] = this.iV;
    return data;
  }
}