import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/core/enum/enum.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_container.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/presentation/manager/home_bloc.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/presentation/widgets/home_screen_body_portirat.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/custom_container_content.dart';
import '../../../../../core/widgets/custom_fruit_container.dart';
import '../../../../../core/widgets/custom_inline_text.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../main_layouts/home/data/models/vendor_products_model.dart';

class SellerDetailsBodyPortirat extends StatelessWidget {
  const SellerDetailsBodyPortirat({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var sellerData =
        ModalRoute.of(context)!.settings.arguments as SellerDetails;

    return Padding(
      padding: EdgeInsets.all(width * 0.03),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var product = state.productsModel?.data;

          return Skeletonizer(
            enabled: state.getVendorProductsState == RequestState.loading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainer(
                  image: sellerData.sellerImage,
                  widget: CustomContainerContent(
                    title: sellerData.sellerName,
                    secondInRow: Text(
                      " Delivery : 40 to 60 Min",
                      style: TextStyle(fontSize: width * 0.035),
                    ),
                    thirdInRow: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              "Open",
                              style: TextStyle(
                                  fontSize: width * 0.035, color: Colors.green),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              "4.5",
                              style: TextStyle(
                                  fontSize: width * 0.035, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.19,
                        ),
                      ],
                    ),
                    rightItem: Padding(
                      padding: EdgeInsets.only(
                          bottom: width * 0.15, right: width * 0.02),
                      child: Image.asset(
                        "assets/images/Path 144.png",
                        // width: width * 0.09,
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  "Categories",
                  style: TextStyle(fontFamily: "Web", fontSize: width * 0.051),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  height: height * 0.164,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            FittedBox(
                              child: CustomFruitContainer(
                                image: images?[index] ?? "",
                                width: width * 0.195,
                                height: height * 0.096,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text(
                              titles[index],
                              style: TextStyle(
                                  fontFamily: "Inter", fontSize: width * 0.05),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: width * 0.03,
                        );
                      },
                      itemCount: images?.length ?? 0),
                ),
                CustomInlineText(
                  leftTitle: "Products",
                  rightTitle: Image.asset("assets/images/Forma 1.png"),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CustomContainer(
                          image: state.productsModel?.data?[index].img ?? "",
                          widget: CustomContainerContent(
                            thirdInRow: Container(
                                width: width * 0.27,
                                height: height * 0.027,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.2),
                                  color: const Color(0xffDF958F),
                                ),
                                child: Center(
                                    child: Text(
                                  "Up to 10% Off",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035),
                                ))),
                            title: state.productsModel!.data![index].nameEn!,
                            secondInRow: Row(
                              children: [
                                Text(
                                    "${state.productsModel!.data![index].priceAfterDiscount!.abs().ceil()}€",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 0.038)),
                                SizedBox(
                                  width: width * 0.025,
                                ),
                                Text(
                                  "${state.productsModel!.data![index].price!.toString()}€",
                                  style: TextStyle(
                                      color: Colors.black26,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: width * 0.038),
                                ),
                              ],
                            ),
                            rightItem: Padding(
                              padding: EdgeInsets.only(right: width * 0.05),
                              child: Image.asset(
                                fit: BoxFit.fill,
                                "assets/images/cont3.png",
                                height: height * 0.06,
                                width: width * 0.15,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.productDetailsRoute,
                                arguments: ProductDetails(
                                    id: product?[index].id ?? 0,
                                    image: product?[index].img ?? "",
                                    categoryName:
                                        product?[index].nameCategoryEn ?? "",
                                    details: product?[index].detailsEn ?? "",
                                    price: product?[index].price ?? 0.0,
                                    priceAfterDiscount: product?[index]
                                            .priceAfterDiscount
                                            ?.abs()
                                            .ceil()
                                            .toString() ??
                                        "",
                                    productName: product?[index].nameEn ?? "",
                                    subUnits: product?[index].subUnits ?? []));
                          },
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: height * 0.02,
                          ),
                      itemCount: state.productsModel?.data?.length ?? 0),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

List<String>? images = [
  "assets/images/fruit.png",
  "assets/images/veg.png",
  "assets/images/Iphone 1.png",
  "assets/images/pet.png",
];
List<String> titles = [
  "Fruits",
  "Vegetables",
  "Phone",
  "Pets",
];

class ProductDetails {
  final String image;
  final String categoryName;
  final String productName;
  final double price;
  final String priceAfterDiscount;
  final String details;
  final int id;
  final List<SubUnits> subUnits;
  int quantity;

  ProductDetails(
      {required this.image,
      required this.categoryName,
      this.quantity = 1,
      required this.productName,
      required this.price,
      required this.priceAfterDiscount,
      required this.details,
      required this.id,
      required this.subUnits});
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'categoryName': categoryName,
      'productName': productName,
      'price': price,
      'priceAfterDiscount': priceAfterDiscount,
      'details': details,
      'id': id,
      'quantity': quantity,
      'subUnits': subUnits.map((e) => e.toJson()).toList()
    };
  }

  factory ProductDetails.fromMap(Map<String, dynamic> map) {
    return ProductDetails(
      image: map['image'],
      categoryName: map['categoryName'],
      productName: map['productName'],
      price: map['price'],
      priceAfterDiscount: map['priceAfterDiscount'],
      details: map['details'],
      id: map['id'],
      quantity: map['quantity'],
      subUnits: List<SubUnits>.from(
        (map['subUnits'] as List).map((e) => SubUnits.fromJson(e)),
      ),
    );
  }
}
