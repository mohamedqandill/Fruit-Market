import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_inline_text.dart';

class DeliveryAddressViewBody extends StatefulWidget {
  const DeliveryAddressViewBody({super.key, required this.selectAddress});

  final Function(String address) selectAddress;

  @override
  State<DeliveryAddressViewBody> createState() =>
      _DeliveryAddressViewBodyState();
}

class _DeliveryAddressViewBodyState extends State<DeliveryAddressViewBody> {
  String? newAddress;
  List<String> addresses = [];
  int? selectedAddressIndex;

  void _showAddAddressDialog() {
    String tempAddress = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Address"),
        content: TextField(
          onChanged: (value) {
            tempAddress = value;
          },
          decoration: const InputDecoration(hintText: "Enter your address"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Cancel
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (tempAddress.trim().isNotEmpty) {
                setState(() {
                  newAddress = tempAddress.trim();
                  addresses.add(newAddress!);
                });
              }
              Navigator.pop(context); // Close dialog
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SizedBox(
      height: height * 0.55,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Select Delivery Address",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: isLandScape ? width * 0.035 : width * 0.048,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Sogeo UI")),
            SizedBox(height: height * 0.02),
            InkWell(
              onTap: _showAddAddressDialog,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                width: width * 0.9,
                height: isLandScape ? height * 0.18 : height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.04),
                    border: Border.all(width: 1, color: Colors.black26)),
                child: CustomInlineText(
                    leftTitle: "Add New Address",
                    rightTitle: Icon(Icons.add, size: width * 0.08)),
              ),
            ),
            SizedBox(height: height * 0.018),
            if (addresses.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: _buildAddressContainer(context, width, height,
                        isLandScape, "My Address", addresses[index], index),
                  );
                },
              )
          ],
        ),
      ),
    );
  }

  Widget _buildAddressContainer(
    BuildContext context,
    double width,
    double height,
    bool isLandScape,
    String title,
    String address,
    int index,
  ) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.025, vertical: height * 0.01),
      width: width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.04),
          border: Border.all(width: 1, color: Colors.black26)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "#${index + 1}   ",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: isLandScape ? width * 0.035 : width * 0.048,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Web"),
                  ),
                  Image.asset("assets/images/Shape 17.png"),
                  SizedBox(width: width * 0.02),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: isLandScape ? width * 0.035 : width * 0.045,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Web"),
                  ),
                ],
              ),
              Radio<int>(
                value: index,
                groupValue: selectedAddressIndex,
                onChanged: (value) {
                  setState(() {
                    selectedAddressIndex = value;
                    widget.selectAddress(address);
                  });
                },
              )
            ],
          ),
          Text(
            address,
            style: TextStyle(
                fontFamily: "Web",
                fontSize: isLandScape ? width * 0.035 : width * 0.05,
                color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
