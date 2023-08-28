class allSpecializationModel {
  bool? status;
  String? message;
  List<Data>? data;
  int? code;

  allSpecializationModel({this.status, this.message, this.data, this.code});

  allSpecializationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int? id;
  String? uuid;
  String? specializationName;
  String? image;
  int? collageId;

  Data(
      {this.id,
        this.uuid,
        this.specializationName,
        this.image,
        this.collageId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    specializationName = json['specialization_name'];
    image = json['image'];
    collageId = json['collage_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['specialization_name'] = this.specializationName;
    data['image'] = this.image;
    data['collage_id'] = this.collageId;
    return data;
  }
}