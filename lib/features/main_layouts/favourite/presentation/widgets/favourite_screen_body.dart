import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/core/enum/enum.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_container_title.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/routes_manager/routes.dart';
import '../../../../../core/widgets/custom_container.dart';
import '../../../../../core/widgets/custom_container_content.dart';
import '../manager/favourite_bloc.dart';

class FavouriteBodyScreen extends StatelessWidget {
  const FavouriteBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return BlocConsumer<FavouriteBloc, FavouriteState>(
      listener: (context, state) {
        if (state.getFavouriteProductsState == RequestState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage.toString())));
        }
      },
      builder: (context, state) {
        var products = state.products?.data;
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.015),
          child: Column(
            children: [
              Expanded(
                child: Skeletonizer(
                  enabled:
                      state.getFavouriteProductsState == RequestState.loading ||
                          state.toggleFavouriteState == RequestState.loading,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CustomContainer(
                            image: products?[index].product?.img ?? "",
                            widget: CustomContainerContent(
                                title: products?[index].product?.nameEn ?? "",
                                secondInRow: Row(
                                  children: [
                                    Text(
                                        "${products?[index].product?.price.toString()}€",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: isLandScape
                                                ? width * 0.03
                                                : width * 0.038)),
                                    SizedBox(
                                      width: width * 0.025,
                                    ),
                                    Text(
                                      "${products?[index].product?.discount.toString()}€",
                                      style: TextStyle(
                                          color: Colors.black26,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: isLandScape
                                              ? width * 0.03
                                              : width * 0.038),
                                    ),
                                  ],
                                ),
                                thirdInRow: CustomContainerTitle(
                                    title: products?[index]
                                            .product
                                            ?.nameCategoryEn ??
                                        ""),
                                rightItem: InkWell(
                                  onTap: () {
                                    BlocProvider.of<FavouriteBloc>(context).add(
                                        ToggleFavourite(
                                            products?[index].id ?? 0));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: width * 0.04,
                                        bottom: height * 0.07),
                                    child: Image.asset(
                                      "assets/images/Icon material-delete-forever.png",
                                      width: width * 0.05,
                                      height: isLandScape
                                          ? height * 0.1
                                          : height * 0.03,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.productDetailsRoute);
                            });
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: height * 0.02,
                          ),
                      itemCount: products?.length ?? 0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
