class RegisterResponse {
  RegisterResponse({
    this.status,
    this.errorMessage,
    this.errorMessageEn,
    this.data,
  });

  RegisterResponse.fromJson(dynamic json) {
    status = json['status'];
    errorMessage = json['error_message'];
    errorMessageEn = json['error_message_en'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? errorMessage;
  String? errorMessageEn;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error_message'] = errorMessage;
    map['error_message_en'] = errorMessageEn;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.mobile,
    this.name,
    this.profilePhotoPath,
    this.token,
  });

  Data.fromJson(dynamic json) {
    mobile = json['mobile'];
    name = json['name'];
    profilePhotoPath = json['profile_photo_path'];
    token = json['token'];
  }
  String? mobile;
  String? name;
  String? profilePhotoPath;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = mobile;
    map['name'] = name;
    map['profile_photo_path'] = profilePhotoPath;
    map['token'] = token;
    return map;
  }
}
