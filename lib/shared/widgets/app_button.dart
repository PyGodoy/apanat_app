import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  
  final String text;
  final VoidCallback onPressed;

  const AppButton( {
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Color(0xFF208286),
        minimumSize: Size(double.infinity, 48),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadiusGeometry.circular(12)
        )
      ),
    );

  }

}