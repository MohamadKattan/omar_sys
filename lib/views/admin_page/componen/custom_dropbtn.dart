// drop btn incluecld list of section from api
import 'package:flutter/material.dart';

Widget customDropButton(
    {double? width,
    double? fontSizeC,
    double? margin,
    required String? dropdownValue,
    required List<String> list,
    required Function(String? valueChange) function}) {
  return Container(
    padding: const EdgeInsets.all(4.0),
    margin: const EdgeInsets.all(4.0),
    decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(4.0)),
    child: DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      dropdownColor: Colors.white,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.orange.shade300,
      ),
      iconSize: 35.0,
      elevation: 16,
      style: TextStyle(color: Colors.black, fontSize: fontSizeC ?? 16),
      underline: Container(
        color: Colors.transparent,
      ),
      onChanged: (String? value) {
        function(value);
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
  );
}
