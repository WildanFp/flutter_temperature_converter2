import 'package:flutter/material.dart';

class targetPerhitungan extends StatelessWidget {
  const targetPerhitungan({
    Key? key,
    required this.selectedDropdown,
    required this.listSatuanSuhu,
    required this.onDropDownChanged,
    required this.onPressed,
  }) : super(key: key);

  final String selectedDropdown;
  final List<String> listSatuanSuhu;
  final Function onDropDownChanged;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: selectedDropdown,
      items: listSatuanSuhu.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        onDropDownChanged(value);
      },
    );
  }
}