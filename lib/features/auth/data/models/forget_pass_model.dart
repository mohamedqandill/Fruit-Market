class ForgetPassModel {
  ForgetPassModel({
    this.status,
    this.message,
    this.data,
  });

  ForgetPassModel.fromJson(dynamic json) {
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
    this.userTypeId,
    this.roleId,
    this.memberPlan,
    this.name,
    this.nameEn,
    this.lastName,
    this.userName,
    this.mobile,
    this.email,
    this.emailVerifiedAt,
    this.currentTeamId,
    this.address,
    this.profilePhotoPath,
    this.columnsNeedApprove,
    this.activitationCode,
    this.isConnect,
    this.lastConnectedAt,
    this.onesignalId,
    this.userBalance,
    this.userLang,
    this.changeUserType,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.newPassword,
    this.token,
    this.profilePhotoUrl,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    userTypeId = json['user_type_id'];
    roleId = json['role_id'];
    memberPlan = json['member_plan'];
    name = json['name'];
    nameEn = json['name_en'];
    lastName = json['last_name'];
    userName = json['user_name'];
    mobile = json['mobile'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    currentTeamId = json['current_team_id'];
    address = json['address'];
    profilePhotoPath = json['profile_photo_path'];
    columnsNeedApprove = json['columns_need_approve'];
    activitationCode = json['activitation_code'];
    isConnect = json['is_connect'];
    lastConnectedAt = json['last_connected_at'];
    onesignalId = json['onesignal_id'];
    userBalance = json['user_balance'];
    userLang = json['user_lang'];
    changeUserType = json['change_user_type'];
    isActive = json['is_active'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    newPassword = json['new_password'];
    token = json['token'];
    profilePhotoUrl = json['profile_photo_url'];
  }
  int? id;
  int? userTypeId;
  int? roleId;
  dynamic memberPlan;
  String? name;
  dynamic nameEn;
  dynamic lastName;
  dynamic userName;
  String? mobile;
  String? email;
  dynamic emailVerifiedAt;
  dynamic currentTeamId;
  dynamic address;
  dynamic profilePhotoPath;
  dynamic columnsNeedApprove;
  dynamic activitationCode;
  String? isConnect;
  dynamic lastConnectedAt;
  dynamic onesignalId;
  int? userBalance;
  String? userLang;
  int? changeUserType;
  String? isActive;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  int? newPassword;
  String? token;
  String? profilePhotoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_type_id'] = userTypeId;
    map['role_id'] = roleId;
    map['member_plan'] = memberPlan;
    map['name'] = name;
    map['name_en'] = nameEn;
    map['last_name'] = lastName;
    map['user_name'] = userName;
    map['mobile'] = mobile;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['current_team_id'] = currentTeamId;
    map['address'] = address;
    map['profile_photo_path'] = profilePhotoPath;
    map['columns_need_approve'] = columnsNeedApprove;
    map['activitation_code'] = activitationCode;
    map['is_connect'] = isConnect;
    map['last_connected_at'] = lastConnectedAt;
    map['onesignal_id'] = onesignalId;
    map['user_balance'] = userBalance;
    map['user_lang'] = userLang;
    map['change_user_type'] = changeUserType;
    map['is_active'] = isActive;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['new_password'] = newPassword;
    map['token'] = token;
    map['profile_photo_url'] = profilePhotoUrl;
    return map;
  }
}
