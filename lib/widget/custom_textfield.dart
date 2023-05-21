import 'package:riverine/res/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.name,
    required this.hintText,
    this.validator,
    this.maxLength = 20,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.initialValue,
    this.fontSize,
    this.textColor,
    this.hintColor,
  }) : super(key: key);

  final String? initialValue;
  final String name;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final int maxLength;
  final bool obscureText;
  final bool readOnly;
  final TextInputType keyboardType;
  final double? fontSize;
  final Color? textColor;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: name,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: fontSize ?? 28.sp,
      ),
      obscureText: obscureText,
      readOnly: readOnly,
      keyboardType: keyboardType,
      cursorColor: Colours.primary,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor ?? Colours.text_ccc,
          fontSize: fontSize ?? 28.sp,
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2.w,
            color: Colors.red,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2.w,
            color: Colours.primary,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2.w,
            color: Colours.divider,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2.w,
            color: Colors.red,
          ),
        ),
      ),
      maxLength: maxLength,
      validator: validator,
    );
  }
}
