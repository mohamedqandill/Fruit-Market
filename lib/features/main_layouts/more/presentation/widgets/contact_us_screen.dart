import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_app_bar.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_field.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/more/presentation/widgets/contact_us_screen_landscape.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var shortSide = MediaQuery.sizeOf(context).shortestSide;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandScape
        ? const ContactUsScreenLandScape()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: const CustomAppBar(title: "Contact Us", actions: []),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.015),
              child: Column(
                children: [
                  const CustomField(title: "Name", label: ""),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  const CustomField(title: "Mobile Number", label: ""),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Center(
                    child: Container(
                      width: width * 0.9,
                      padding: EdgeInsets.symmetric(
                          horizontal: shortSide >= 900 ? width * 0.2 : 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Message",
                            style: TextStyle(
                                fontFamily: "Arial", color: Colors.black45),
                          ),
                          SizedBox(height: height * 0.008),
                          TextFormField(
                            maxLines: 4,
                            decoration: InputDecoration(
                              labelStyle: const TextStyle(fontFamily: "Arial"),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.1),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.2)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Custombutton(
                    title: "Submit",
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: height * 0.035,
                  ),
                  SizedBox(
                    height: height * 0.07,
                    width: width * 0.8,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: width * 0.147,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.5),
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: Image.asset(
                              icons[index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: width * 0.06,
                          );
                        },
                        itemCount: icons.length),
                  )
                ],
              ),
            ),
          );
  }
}

List<String> icons = [
  "assets/images/Vector.png",
  "assets/images/Vector1.png",
  "assets/images/Vector2.png",
  "assets/images/Vector3.png",
];
