import 'package:flutter/material.dart';
import 'package:kitprod/utils/color.dart';

TextButton textButton(String text, {void Function()? onPress}) {
  return TextButton(
    onPressed: onPress,
    child: Text(
      text,
      style: TextStyle(fontFamily: "GilroySemiBold"),
    ),
    style: TextButton.styleFrom(primary: CustomColors.brandingSecondaryGreen),
  );
}
