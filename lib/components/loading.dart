import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: CircularProgressIndicator(
        strokeWidth: 10,
        backgroundColor: Colors.cyanAccent,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );
  }
}
