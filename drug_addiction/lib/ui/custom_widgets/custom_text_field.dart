import 'package:drug_addiction/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final  onChange;
  final String message;
  final bool isObsecure;
  final bool isNumber;
  final TextEditingController controller;
  CustomTextFields(
      {required this.hintText,
      required this.icon,
      required this.onChange,
      required this.message,
       this.isObsecure = false,
      required this.controller,
       this.isNumber = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: darkGreyColor),
      child: TextFormField(
        style:  TextStyle(color: whiteColor),
        cursorColor: whiteColor,
        keyboardType: isNumber ? TextInputType.number : null,
        onChanged: onChange,
        controller: controller,
        obscureText: isObsecure,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: whiteColor,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.3, color: whiteColor)),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1.3, color: whiteColor)),
            hintText: hintText,
            hintStyle: TextStyle(color: whiteColor, fontSize: 16)),
        validator: (value) {
          if (value!.isEmpty) {
            return message;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
