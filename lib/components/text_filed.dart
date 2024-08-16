import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldText extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final VoidCallback? onSuffixIconPressed;

  const FieldText({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.suffixIcon,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: keyboardType ?? TextInputType.text,
        validator: validator,
        controller: controller,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFF2D2D2E),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF363738)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF4D4F51), width: 0.8),
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
            icon: suffixIcon!,
            onPressed: onSuffixIconPressed,
          )
              : null,
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}