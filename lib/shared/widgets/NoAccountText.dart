import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  
  final VoidCallback onTap;
  final String text;
  final String InitialText;

  const NoAccountText({
    super.key,
    required this.onTap,
    required this.text,
    required this.InitialText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          InitialText,
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 14,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}