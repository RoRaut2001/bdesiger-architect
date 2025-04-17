import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpaticField extends StatelessWidget {
  final bool isEnforced;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix, suffix;

  const OpaticField({
    super.key,
    this.isEnforced = false,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.prefix,
    this.suffix,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLength: isEnforced ? 10 : null,
      maxLengthEnforcement: isEnforced ? MaxLengthEnforcement.enforced : null,
      decoration: InputDecoration(
        suffixIcon: suffix,
        prefixIcon: prefix,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.black
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.black
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.black
          ),
        ),
      ),
    );
  }
}
