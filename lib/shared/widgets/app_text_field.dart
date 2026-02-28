import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTextField extends StatelessWidget {

  final String label;
  final String hintlabel;

  const AppTextField({
    super.key,
    required this.label,
    required this.hintlabel
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 14,),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white)
          ),
          child: TextField(
            cursorColor: Color(0xFF208286),
            style:TextStyle(
              color: Colors.white
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 12),
              border: InputBorder.none,
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              hintText: hintlabel,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5)
              )
            ),
          ),
        ),
      ],
    );
  }  
}