import 'package:flutter/material.dart';

Widget buildExpandableSection({
  required String title,
  required bool expanded,
  required VoidCallback onToggle,
  required Map<String, String> options,
  required String? selectedValue,
  required Function(String?) onChanged,
  required BuildContext context,
}) {
  var width = MediaQuery.sizeOf(context).width;

  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        ListTile(
          title: Text(title,
              style: TextStyle(
                  fontSize: width * 0.045,
                  fontFamily: "Web",
                  fontWeight: FontWeight.bold)),
          trailing: Icon(
            expanded ? Icons.expand_less : Icons.expand_more,
            color: Colors.grey,
          ),
          onTap: onToggle,
        ),
        if (expanded)
          Padding(
            padding: EdgeInsets.zero,
            child: Column(
              children: options.entries.map((entry) {
                return Padding(
                  padding: EdgeInsets.zero,
                  child: RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    value: entry.key,
                    groupValue: selectedValue,
                    title: Text(entry.value,
                        style: TextStyle(
                          fontSize: width * 0.038,
                          color: Colors.black54,
                          fontFamily: "Web",
                        )),
                    activeColor: Colors.green,
                    onChanged: onChanged,
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    ),
  );
}
