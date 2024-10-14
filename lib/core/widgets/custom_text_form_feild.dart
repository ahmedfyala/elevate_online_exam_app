import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    this.isPasswordVisible = true,
    this.showPassword,
  });

  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  bool isPasswordVisible;
  void Function()? showPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  // Focus node to track the focus of the TextFormField
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    // Listen to focus changes
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: (_isFocused && widget.showPassword != null)
            ? IconButton(
                onPressed: widget.showPassword,
                icon: Icon(
                  widget.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off, // Toggle icon based on visibility
                ),
              )
            : null,
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.showPassword == null
          ? false
          : widget.isPasswordVisible, // Toggle password visibility
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}
