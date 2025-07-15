import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.image = "assets/images/home5.png",
      required this.widget,
      required this.onPressed});
  final Widget widget;
  final VoidCallback onPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return InkWell(
      onTap: onPressed,
      child: LayoutBuilder(
        builder: (context, constraints) {
          print("$baseImageUrl$image");
          return Container(
            width: double.infinity,
            height: isLandScape
                ? height * 0.4
                : constraints.maxWidth > 600
                    ? height * 0.15
                    : height * 0.12,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 2)
                ],
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.01)),
                borderRadius: BorderRadius.circular(width * 0.05)),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(
                        isLandScape ? width * 0.004 : width * 0.02),
                    child: SizedBox(
                      width: width * 0.22,
                      height: height * 0.1,
                      child: CachedNetworkImage(
                        imageUrl: "$baseImageUrl$image",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height * 0.03),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )),
                widget
              ],
            ),
          );
        },
      ),
    );
  }
}
