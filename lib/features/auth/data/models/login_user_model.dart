class LoginUserModel {
  LoginUserModel({
    this.status,
    this.message,
    this.data,
  });

  LoginUserModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.roleId,
    this.address,
    this.profilePhotoPath,
    this.token,
    this.profilePhotoUrl,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    roleId = json['role_id'];
    address = json['address'];
    profilePhotoPath = json['profile_photo_path'];
    token = json['token'];
    profilePhotoUrl = json['profile_photo_url'];
  }
  int? id;
  String? name;
  String? mobile;
  String? email;
  int? roleId;
  dynamic address;
  String? profilePhotoPath;
  String? token;
  String? profilePhotoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['mobile'] = mobile;
    map['email'] = email;
    map['role_id'] = roleId;
    map['address'] = address;
    map['profile_photo_path'] = profilePhotoPath;
    map['token'] = token;
    map['profile_photo_url'] = profilePhotoUrl;
    return map;
  }
}
