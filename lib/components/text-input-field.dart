import 'package:flutter/material.dart';
import 'package:kitprod/utils/color.dart';

class TextInputField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final IconData? suffixIcon;

  TextInputField({Key? key, this.label, this.hintText, this.suffixIcon})
      : super(key: key);

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  static TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label!,
          style: TextStyle(fontSize: 18, fontFamily: "GilroySemiBold"),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: _controller,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(fontFamily: "GilroyRegular", fontSize: 18),
          decoration: InputDecoration(
            hintText: widget.hintText!,
            suffixIcon: Icon(
              widget.suffixIcon,
              color: Colors.black87,
              size: 28,
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1.55, color: Colors.black87)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    width: 1.55, color: CustomColors.brandingSecondaryGreen)),
          ),
        )
      ],
    );
  }
}
