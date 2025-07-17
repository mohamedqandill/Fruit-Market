import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/core/enum/enum.dart';
import 'package:responsive_adaptive_ui/features/seller_details/presentation/widgets/seller_details_body_portirat.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../../core/widgets/custom_container.dart';
import '../../../../../core/widgets/custom_container_content.dart';
import '../manager/basket_bloc.dart';
import 'custom_basket_text.dart';

class BasketBodyViewPortrait extends StatefulWidget {
  const BasketBodyViewPortrait({super.key});

  @override
  State<BasketBodyViewPortrait> createState() => _BasketBodyViewPortraitState();
}

class _BasketBodyViewPortraitState extends State<BasketBodyViewPortrait> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: width * 0.01),
      child: BlocConsumer<BasketBloc, BasketState>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = BlocProvider.of<BasketBloc>(context);
          return Skeletonizer(
            enabled: state.getTotalPriceState == RequestState.loading ||
                state.getAllProductState == RequestState.loading ||
                state.deleteProductState == RequestState.loading,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.52,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CustomContainer(
                            image: state.products?[index].image ?? "",
                            widget: CustomContainerContent(
                                title: state.products?[index].productName ?? "",
                                secondInRow: Row(
                                  children: [
                                    Text(
                                        "${state.products?[index].priceAfterDiscount} KD",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: width * 0.039)),
                                    SizedBox(
                                      width: width * 0.025,
                                    ),
                                    Text(
                                      "${state.products?[index].price} KD",
                                      style: TextStyle(
                                          color: Colors.black26,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: width * 0.039),
                                    ),
                                  ],
                                ),
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
                                  )),
                                ),
                                rightItem: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: width * 0.04,
                                          top: width * 0.02),
                                      child: InkWell(
                                        onTap: () {
                                          bloc.add(DeleteProduct(
                                              state.products?[index].id ?? 0));
                                        },
                                        child: Image.asset(
                                          "assets/images/Icon material-delete-forever.png",
                                          width: width * 0.048,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: width * 0.02,
                                          bottom: width * 0.01),
                                      child: Container(
                                        width: width * 0.3,
                                        height: height * 0.03,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: Colors.grey),
                                            borderRadius: BorderRadius.circular(
                                                width * 0.5)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              child: Icon(
                                                Icons.remove,
                                                size: width * 0.048,
                                              ),
                                              onTap: () {
                                                bloc.add(DecreaseProduct(
                                                    state.products?[index].id ??
                                                        0));
                                              },
                                            ),
                                            Text(
                                              state.products?[index].quantity
                                                      .toString() ??
                                                  "",
                                              style: TextStyle(
                                                fontFamily: "Web",
                                                fontSize: width * 0.038,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                bloc.add(IncreaseProduct(
                                                    state.products?[index].id ??
                                                        0));
                                              },
                                              child: Icon(
                                                Icons.add,
                                                size: width * 0.048,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.productDetailsRoute);
                            });
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: height * 0.02,
                          ),
                      itemCount: state.products?.length ?? 0),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: List.generate(
                          50,
                          (index) {
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: width * 0.0035),
                                child: Container(
                                  width: width * 0.001,
                                  height: height * 0.002,
                                  color: Colors.black26,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomBasketText(
                        title: "Subtotal",
                        price: state.totalPrice?.toString() ?? "",
                        currency: "KD",
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      const CustomBasketText(
                        title: "Shipping Charges",
                        price: "0.0",
                        currency: "KD",
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      CustomBasketText(
                        title: "Bag Total",
                        price: state.totalPrice?.toString() ?? "",
                        currency: "KD",
                        isBold: true,
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: height * 0.01),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${state.products?.length.toString() ?? ""} Items in cart",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: width * 0.039,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Web")),
                                Text("${state.totalPrice?.toString() ?? ""} KD",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 0.045,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Web"))
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        primaryColor.withOpacity(0.77),
                                    fixedSize:
                                        Size(width * 0.53, height * 0.03)),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.checkoutRoute,
                                      arguments: OrderedProducts(
                                          totalPrice: state.totalPrice ?? 0.0,
                                          products: state.products ?? []));
                                },
                                child: FittedBox(
                                  child: Text(
                                    "Proceed To Checkout",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.038),
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class OrderedProducts {
  final double totalPrice;
  final List<ProductDetails> products;
  OrderedProducts({required this.totalPrice, required this.products});
}
