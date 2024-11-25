import 'package:flutter/material.dart';

class CustomRoundTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? Function()? validator;
  final bool isObscure;
  final bool isOnlyNumber;

  const CustomRoundTextfield(
      {super.key,
      required this.controller,
      required this.title,
      required this.validator,
      this.isObscure = false,
      this.isOnlyNumber = false});

  @override
  State<CustomRoundTextfield> createState() => _CustomRoundTextfieldState();
}

class _CustomRoundTextfieldState extends State<CustomRoundTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
        child: TextFormField(
          obscureText: widget.isObscure,
          keyboardType: widget.isOnlyNumber ? TextInputType.number : null,
          validator: (value) {
            return widget.validator!();
          },
          style: const TextStyle(
              color: Color.fromARGB(255, 106, 106, 106), fontSize: 16),
          controller: widget.controller,
          decoration: InputDecoration(
            errorMaxLines: 2,
            contentPadding: const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 5.0, bottom: 5.0),
            hintText: widget.title,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            filled: true,
            fillColor: const Color(
              0xFFF7F9FC,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.grey,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.grey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.grey,
              ),
            ),
          ),
        ));
  }
}
