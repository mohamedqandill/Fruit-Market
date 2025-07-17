class FavouriteProducts {
  FavouriteProducts({
    this.result,
    this.errorMessage,
    this.errorMessageEn,
    this.data,
  });

  FavouriteProducts.fromJson(dynamic json) {
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
    this.favoId,
    this.priceWithDiscount,
    this.product,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    favoId = json['favo_id'];
    priceWithDiscount = json['price_with_discount'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  int? id;
  int? favoId;
  int? priceWithDiscount;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['favo_id'] = favoId;
    map['price_with_discount'] = priceWithDiscount;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }
}

class Product {
  Product({
    this.id,
    this.name,
    this.nameEn,
    this.discount,
    this.categoryId,
    this.quantity,
    this.price,
    this.img,
    this.details,
    this.detailsEn,
    this.nameCategory,
    this.nameCategoryEn,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    discount = (json['discount'] as num?)?.toDouble();
    categoryId = json['category_id'];
    quantity = json['quantity'];
    price = (json['price'] as num?)?.toDouble();
    img = json['img'];
    details = json['details'];
    detailsEn = json['details_en'];

    nameCategory = json['name_category'];
    nameCategoryEn = json['name_category_en'];
  }
  int? id;
  String? name;
  String? nameEn;
  double? discount;
  int? categoryId;
  int? quantity;
  double? price;
  String? img;
  String? details;
  String? detailsEn;
  String? nameCategory;
  String? nameCategoryEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['name_en'] = nameEn;
    map['discount'] = discount;
    map['category_id'] = categoryId;
    map['quantity'] = quantity;
    map['price'] = price;
    map['img'] = img;
    map['details'] = details;
    map['details_en'] = detailsEn;

    map['name_category'] = nameCategory;
    map['name_category_en'] = nameCategoryEn;

    return map;
  }
}
