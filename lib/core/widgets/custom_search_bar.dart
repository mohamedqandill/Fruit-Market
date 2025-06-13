import 'package:flutter/material.dart';

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
            return List<ListTile>.generate(
              5,
              (index) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text("Result $index"),
                  onTap: () {
                    _searchController.closeView("Result $index");
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
