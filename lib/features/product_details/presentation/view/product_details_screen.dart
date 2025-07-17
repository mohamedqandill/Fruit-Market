import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';
import 'package:responsive_adaptive_ui/core/enum/enum.dart';
import 'package:responsive_adaptive_ui/core/local_storage_service/hive.dart';
import 'package:responsive_adaptive_ui/core/local_storage_service/prefs.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_app_bar.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/favourite/presentation/manager/favourite_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../../di.dart';
import '../../../seller_details/presentation/widgets/seller_details_body_portirat.dart';
import '../widgets/product_details_body.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool? isInCart;

  late SharedPrefs prefs;
  ProductDetails? product;
  bool initialized = false;

  @override
  void didChangeDependencies() {
    if (!initialized) {
      prefs = SharedPrefs();
      product = ModalRoute.of(context)!.settings.arguments as ProductDetails;
      isInCart = prefs.getBool("isInCart${product!.id}") ?? false;
      print("prodId ${product!.id}");
      initialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final product =
        ModalRoute.of(context)!.settings.arguments as ProductDetails;

    return BlocProvider(
      create: (context) => getIt<FavouriteBloc>(),
      child: BlocConsumer<FavouriteBloc, FavouriteState>(
        listener: (context, state) {
          if (state.toggleFavouriteState == RequestState.success) {
            if (!isInCart!) {
              toastification.show(
                  context: context,
                  icon: const Icon(Icons.check_circle_outline),
                  title: const Text(
                    'Product Deleted Successfully',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  autoCloseDuration: const Duration(seconds: 5),
                  backgroundColor: primaryColor);
            } else {
              toastification.show(
                  context: context,
                  icon: const Icon(Icons.check_circle_outline),
                  title: const Text(
                    'Product Added Successfully',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  autoCloseDuration: const Duration(seconds: 5),
                  backgroundColor: primaryColor);
            }
          }
        },
        builder: (context, state) {
          var bloc = BlocProvider.of<FavouriteBloc>(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(title: product.productName, actions: [
              InkWell(
                onTap: () async {
                  bloc.add(ToggleFavourite(product.id));
                  isInCart = !isInCart!;
                  await prefs.setBool("isInCart${product.id}", isInCart!);
                  setState(() {});
                },
                child: !isInCart!
                    ? const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.black,
                          size: 35,
                        ),
                      )
                    : Image.asset(
                        "assets/images/fav.png",
                        height: isLandScape ? height * 0.3 : height * 0.07,
                        color: Colors.black,
                        colorBlendMode: BlendMode.color,
                      ),
              ),
              Icon(
                Icons.ios_share_outlined,
                size: isLandScape ? width * 0.05 : width * 0.07,
              ),
              SizedBox(
                width: width * 0.02,
              )
            ]),
            body: const ProductDetailsBody(),
            bottomNavigationBar: LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor.withOpacity(0.77),
                              fixedSize: Size(
                                  width * 0.42,
                                  constraints.maxWidth >= 600
                                      ? height * 0.045
                                      : height * 0.03)),
                          onPressed: () async {
                            await HiveCart.addProduct(product).then(
                              (value) {
                                toastification.show(
                                    context: context,
                                    icon:
                                        const Icon(Icons.check_circle_outline),
                                    title: const Text(
                                      'Product Added To Your Cart Successfully',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    autoCloseDuration:
                                        const Duration(seconds: 5),
                                    backgroundColor: primaryColor);
                              },
                            );
                          },
                          child: Center(
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/basket.png",
                                  height: height * 0.21,
                                  width: width * 0.085,
                                ),
                                Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                      fontFamily: "Web",
                                      color: Colors.white,
                                      fontSize: width * 0.04),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
