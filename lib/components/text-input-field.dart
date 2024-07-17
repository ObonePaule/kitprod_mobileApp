import 'package:flutter/material.dart';
import 'package:kitprod/utils/color.dart';

Column formInputControl(
    {String? label,
    String? hintText,
    IconData? icon,
    bool obscureText = false,
    TextInputType inputType = TextInputType.name,
    TextEditingController? controller}) {
  final double _borderSideWidth = 1.35;
  final double _borderRadius = 8;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label!.toUpperCase(),
        style: TextStyle(
            fontSize: 12,
            fontFamily: "GilroyBold",
            color: CustomColors.brandingGreenDark),
      ),
      SizedBox(height: 2),
      TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        style: TextStyle(
            fontFamily: "GilroyRegular",
            fontSize: 16,
            color: CustomColors.brandingGreenDark),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
          hintText: hintText!,
          suffixIcon: Icon(
            icon!,
            color: CustomColors.brandingGreenDark,
            size: 24,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
              borderSide: BorderSide(
                  width: _borderSideWidth,
                  color: CustomColors.brandingGreenDark)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_borderRadius),
              borderSide: BorderSide(
                  width: _borderSideWidth,
                  color: CustomColors.brandingGreenDark)),
        ),
      )
    ],
  );
}
