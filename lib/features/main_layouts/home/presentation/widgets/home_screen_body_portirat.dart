import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/enum/enum.dart';
import '../../../../../core/widgets/custom_container.dart';
import '../../../../../core/widgets/custom_container_title.dart';
import '../../../../../core/widgets/custom_fruit_container.dart';
import '../../../../../core/widgets/custom_inline_text.dart';
import '../manager/home_bloc.dart';

class HomeScreenBodyPortirat extends StatefulWidget {
  const HomeScreenBodyPortirat({super.key});

  @override
  State<HomeScreenBodyPortirat> createState() => _HomeScreenBodyPortiratState();
}

class _HomeScreenBodyPortiratState extends State<HomeScreenBodyPortirat> {
  var currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              var homeBloc = BlocProvider.of<HomeBloc>(context);
              var vendorInfo = state.vendorsModel?.data?.info;

              return Skeletonizer(
                enabled: state.getVendorsState == RequestState.loading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: height * 0.145,
                        child: CachedNetworkImage(
                          imageUrl:
                              "$baseImageUrl${state.offersModel?.data?[0].img}",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(height * 0.03),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    SizedBox(
                      height: height * 0.093,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomFruitContainer(
                              width: width * 0.20,
                              height: height * 0.09,
                              image: images[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: width * 0.038,
                            );
                          },
                          itemCount: 4),
                    ),
                    const CustomInlineText(
                      leftTitle: "Sellers",
                      rightTitle: Text("Show all",
                          style: TextStyle(
                              color: Color(0xff235C95),
                              fontSize: 18,
                              fontFamily: "Arial")),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: height * 0.01,
                        ),
                        itemCount: vendorInfo?.length ?? 0,
                        itemBuilder: (context, index) {
                          return CustomContainer(
                            image: state.vendorsModel?.data?.info?[index].img ??
                                "",
                            widget: Expanded(
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.008),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomContainerTitle(
                                          title:
                                              vendorInfo?[index].nameEn ?? "",
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/images/delivIcon.png"),
                                            Text(
                                              "  Delivery Charges : ${vendorInfo?[index].deliveryCharges ?? "0.5 KD"}",
                                              style: TextStyle(
                                                  color: Colors.black38,
                                                  fontFamily: "Web",
                                                  fontSize: width * 0.035),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 5,
                                                  height: 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.grey,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                SizedBox(width: width * 0.02),
                                                Text(
                                                  vendorInfo?[index].isOpened ==
                                                          "Y"
                                                      ? "Open"
                                                      : "Close",
                                                  style: TextStyle(
                                                      fontSize: width * 0.035,
                                                      color: Colors.green),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.grey,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                SizedBox(width: width * 0.02),
                                                Text(
                                                  vendorInfo?[index].nameEn ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: width * 0.035,
                                                      color: Colors.blueAccent),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: width * 0.07,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: width * 0.03),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.02),
                                          child: Text("4.5",
                                              style: TextStyle(
                                                  fontSize: width * 0.035,
                                                  color: Colors.grey)),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: height * 0.01),
                                          child: Row(
                                            children: [
                                              Text("2.5KM",
                                                  style: TextStyle(
                                                      fontSize: width * 0.035,
                                                      color: Colors.grey)),
                                              Image.asset(
                                                  "assets/images/Path 218.png")
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.sellerRoute,
                                  arguments: SellerDetails(
                                      sellerName: state.vendorsModel?.data
                                              ?.info?[index].nameEn ??
                                          "",
                                      sellerImage: state.vendorsModel?.data
                                              ?.info?[index].img ??
                                          ""));
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

List<String> images = [
  "assets/images/home1.png",
  "assets/images/home2.png",
  "assets/images/home3.png",
  "assets/images/home4.png",
];

class SellerDetails {
  String sellerName;
  String sellerImage;

  SellerDetails({required this.sellerName, required this.sellerImage});
}
