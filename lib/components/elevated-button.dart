import 'package:flutter/material.dart';
import 'package:kitprod/utils/color.dart';

ElevatedButton elevatedButton(String text,
    {void Function()? onPress}) {
  return ElevatedButton(
    onPressed: onPress,
    child: Text(
      text.toUpperCase(),
      style: TextStyle(fontSize: 16, fontFamily: "GilroyBold"),
    ),
    style: ElevatedButton.styleFrom(
      primary: CustomColors.brandingGreenDark,
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      minimumSize: Size(double.infinity, 30),
    ),
  );
}
