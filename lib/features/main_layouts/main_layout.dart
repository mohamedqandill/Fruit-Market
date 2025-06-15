import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_search_bar.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/basket/presentation/view/basket_screen.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/favourite/presentation/view/favourite_screen.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/presentation/view/home_screen.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/more/presentation/view/more_screen.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/orders/presentation/view/orders_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../core/widgets/main_app_bar.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int currentIndex = 0;
  bool isSearchOn = false;

  final List<Widget> screens = [
    const HomeScreen(),
    const OrdersScreen(),
    const BasketScreen(),
    const FavouriteScreen(),
    const MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var h = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: MainAppBar(
            onTap: () {
              setState(() {
                isSearchOn = true;
              });
            },
            height: constraints.maxWidth > 900
                ? 80
                : constraints.maxWidth > 600
                    ? 55
                    : 50,
          ),
          body: isSearchOn
              ? CustomSearchBar(
                  onTap: () {
                    setState(() {
                      isSearchOn = false;
                    });
                  },
                )
              : screens[currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(17),
              topRight: Radius.circular(17),
            ),
            child: SalomonBottomBar(
              itemPadding: EdgeInsets.symmetric(
                  horizontal: isLandScape ? width * 0.018 : width * 0.015),
              unselectedItemColor: Colors.white,
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              margin: EdgeInsets.all(width * 0.0088),
              selectedItemColor: Colors.white,
              selectedColorOpacity: 0.91,
              backgroundColor: const Color(0xff204F38),
              items: [
                /// Home
                SalomonBottomBarItem(
                  icon: CustomImage(
                    isSelected: currentIndex == 0 ? true : false,
                    image: "assets/images/home.png",
                    width: isLandScape ? width * 0.04 : width * 0.05,
                  ),
                  title: CustomText(
                    isLandScape: isLandScape ? true : false,
                    text: 'Home',
                  ),
                ),

                /// Orders
                SalomonBottomBarItem(
                  icon: Icon(
                    Icons.format_list_numbered_rounded,
                    size: isLandScape ? h * 0.11 : h * 0.049,
                    color: currentIndex == 1 ? Colors.black : Colors.white,
                  ),
                  title: CustomText(
                    isLandScape: isLandScape ? true : false,
                    text: 'Orders',
                  ),
                ),

                /// Basket
                SalomonBottomBarItem(
                  icon: CustomImage(
                    isSelected: currentIndex == 2 ? true : false,
                    image: "assets/images/basket.png",
                    width: isLandScape ? width * 0.04 : width * 0.05,
                  ),
                  title: CustomText(
                    isLandScape: isLandScape ? true : false,
                    text: 'Basket',
                  ),
                ),

                /// Favourite
                SalomonBottomBarItem(
                  icon: CustomImage(
                    isSelected: currentIndex == 3 ? true : false,
                    image: "assets/images/favourite.png",
                    width: isLandScape ? width * 0.04 : width * 0.05,
                  ),
                  title: CustomText(
                    isLandScape: isLandScape ? true : false,
                    text: 'Favourite',
                  ),
                ),

                /// More
                SalomonBottomBarItem(
                  icon: CustomImage(
                    isSelected: currentIndex == 4 ? true : false,
                    image: "assets/images/more.png",
                    width: width * 0.05,
                  ),
                  title: CustomText(
                    isLandScape: isLandScape ? true : false,
                    text: 'More',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({required this.text, super.key, required this.isLandScape});
  final String text;
  final bool isLandScape;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).height;
    return Text(text,
        style: TextStyle(
            fontSize: isLandScape ? width * 0.05 : width * 0.015,
            color: Colors.black,
            fontFamily: "Segoe UI"));
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage(
      {required this.isSelected,
      required this.image,
      required this.width,
      super.key});
  final String image;
  final double width;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      // width: ,
      color: isSelected ? Colors.black : Colors.white,
    );
  }
}
