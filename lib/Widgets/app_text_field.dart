import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;

  final String _label;
  final IconData _icon;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,

    required this._icon,
    required this._label,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: _label,
        suffixIcon: Icon(_icon),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
