import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_container.dart';

import '../routes_manager/routes.dart';
import 'custom_container_title.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late SearchController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = SearchController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: widget.onTap,
            child: Icon(
              Icons.arrow_back_ios_new,
              size: width * 0.07,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SearchAnchor(
          isFullScreen: false,
          viewBackgroundColor: Colors.white,
          searchController: _searchController,
          builder: (context, controller) {
            return SearchBar(
              backgroundColor: WidgetStateProperty.all(Colors.white),
              surfaceTintColor: WidgetStateProperty.all(Colors.white),
              shadowColor: WidgetStateProperty.all(Colors.transparent),
              elevation: WidgetStateProperty.all(0),
              controller: controller,
              hintText: 'What are you looking for?',
              hintStyle: WidgetStateProperty.all(TextStyle(
                  fontFamily: "Web",
                  color: Colors.black45,
                  fontSize: width * 0.041)),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.02),
                  side: BorderSide(
                    color: Colors.grey,
                    width: width * 0.003,
                  ),
                ),
              ),
              leading: const Icon(Icons.search),
              onTap: () {
                controller.openView();
              },
              onChanged: (value) {},
            );
          },
          suggestionsBuilder: (context, controller) {
            return List<CustomContainer>.generate(
              3,
              (index) {
                return CustomContainer(
                  widget: Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.008),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomContainerTitle(
                                title: "Seller name",
                              ),
                              Row(
                                children: [
                                  Image.asset("assets/images/delivIcon.png"),
                                  Text(
                                    "  Delivery Charges : 0.5 KD",
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
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Text(
                                        "Open",
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
                                        decoration: const BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Text(
                                        "Pizza",
                                        style: TextStyle(
                                            fontSize: width * 0.035,
                                            color: Colors.blueAccent),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: width * 0.19,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.02),
                                child: Text("4.5",
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: Colors.grey)),
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(bottom: height * 0.01),
                                child: Row(
                                  children: [
                                    Text("2.5KM",
                                        style: TextStyle(
                                            fontSize: width * 0.035,
                                            color: Colors.grey)),
                                    Image.asset("assets/images/Path 218.png")
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
                    Navigator.pushNamed(context, Routes.sellerRoute);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
