import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  CustomFormField({
    required this.label,
    this.keyboardType = TextInputType.text,
    this.isDropdown = false,
    this.dropdownItems,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return isDropdown
        ? DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
            items: dropdownItems
                ?.map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: onChanged,
            validator: validator,
          )
        : TextFormField(
            decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
            keyboardType: keyboardType,
            onChanged: onChanged,
            validator: validator,
          );
  }
}
