import 'package:flutter/material.dart';

import '../../../../../core/widgets/customButton.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  var selectedLanguage;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return LayoutBuilder(
      builder: (context, constraints) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 0.05),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(width * 0.04),
              height: height * 0.35,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                          value: 1,
                          groupValue: selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value!;
                            });
                          },
                        ),
                      ),
                      Image.asset(
                        'assets/images/Clip path group.png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        'العربيه',
                        style: TextStyle(fontSize: width * 0.05),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: constraints.maxWidth < 380
                        ? height * 0.005
                        : height * 0.02,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                          value: 2,
                          groupValue: selectedLanguage,
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value!;
                            });
                          },
                        ),
                      ),
                      Image.asset(
                        'assets/images/Group 2851.png',
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        'English',
                        style: TextStyle(fontSize: width * 0.05),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: Custombutton(
                      title: "Apply",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      isSmall: true,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Close",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Web",
                            fontSize: width * 0.04),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
