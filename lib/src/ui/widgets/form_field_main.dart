import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nu_finances/src/utils/values/colors.dart';

class FormFieldMain extends StatelessWidget {
  const FormFieldMain({
    this.key,
    required this.obscured,
    required this.marginLeft,
    required this.marginRight,
    required this.marginTop,
    required this.textInputType,
    required this.hintText,
    this.onChanged,
    this.errorText
  }) : super(key: key);

  final Key? key;
  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final TextInputType textInputType;
  final String hintText;
  final bool obscured;
  final void Function(void)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft, right: marginRight, top: marginTop),
      child: TextField(
        key: key,
        onChanged: onChanged,
        keyboardType: textInputType,
        obscureText: obscured,
        decoration: InputDecoration(
          errorText: errorText,
          filled: true,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: Color(0xCC000000)
              ),
              borderRadius: BorderRadius.all(Radius.circular(0))
          ),
          fillColor: Colors.white,
          hintText: hintText,
          labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConstant.colorMainPurple),
          ),
        ),
      ),
    );
  }
}
