class OffersModel {
  OffersModel({
    this.result,
    this.errorMessage,
    this.errorMessageEn,
    this.data,
  });

  OffersModel.fromJson(dynamic json) {
    result = json['result'];
    errorMessage = json['error_message'];
    errorMessageEn = json['error_message_en'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? result;
  String? errorMessage;
  String? errorMessageEn;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    map['error_message'] = errorMessage;
    map['error_message_en'] = errorMessageEn;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.ord,
    this.type,
    this.name,
    this.img,
    this.urlL,
    this.withId,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    ord = json['ord'];
    type = json['type'];
    name = json['name'];
    img = json['img'];
    urlL = json['url_l'];
    withId = json['with_id'];
  }
  int? id;
  int? ord;
  String? type;
  String? name;
  String? img;
  dynamic urlL;
  int? withId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ord'] = ord;
    map['type'] = type;
    map['name'] = name;
    map['img'] = img;
    map['url_l'] = urlL;
    map['with_id'] = withId;
    return map;
  }
}
