import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final bool isPassword;
  final Widget? prefixIcon;
  final String? Function(String?) validator;

  const CTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    this.isPassword = false,
    this.prefixIcon,
    required this.validator,
  });

  @override
  State<CTextFormField> createState() => _CTextFormFieldState();
}

class _CTextFormFieldState extends State<CTextFormField> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            fontSize: 16.0,
            color: Color(0xFF232323),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.isPassword && _isObscured,
          style: const TextStyle(fontSize: 16.0, color: Color(0xFF232323)),
          decoration: InputDecoration(
            errorMaxLines: 3,
            prefixIconColor: Color(0xFF939393),
            suffixIconColor: Color(0xFF939393),
            labelStyle: const TextStyle(
              fontSize: 16.0,
              color: Color(0xFF232323),
            ),
            hintStyle: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF232323),
            ),
            errorStyle: const TextStyle(fontStyle: FontStyle.normal),
            floatingLabelStyle: TextStyle(
              color: const Color(0xFF232323).withOpacity(0.8),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 1, color: Color(0xFFE0E0E0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 1, color: Color(0xFFE0E0E0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 1, color: Color(0xFF272727)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 1, color: Color(0xFFF57C00)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 2, color: Color(0xFFF57C00)),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      icon: Icon(
                        _isObscured ? Iconsax.eye_slash : Iconsax.eye,
                        color: const Color(0xFF939393),
                      ),
                      onPressed:
                          () => setState(() => _isObscured = !_isObscured),
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
