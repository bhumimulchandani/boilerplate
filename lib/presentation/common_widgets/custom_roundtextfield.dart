// import 'package:flutter/material.dart';

// class CustomRoundTextfield extends StatefulWidget {
//   final TextEditingController controller;
//   final String title;
//   final String? Function()? validator;
//   final bool isObscure;
//   final bool isOnlyNumber;

//   const CustomRoundTextfield(
//       {super.key,
//       required this.controller,
//       required this.title,
//       required this.validator,
//       this.isObscure = false,
//       this.isOnlyNumber = false});

//   @override
//   State<CustomRoundTextfield> createState() => _CustomRoundTextfieldState();
// }

// class _CustomRoundTextfieldState extends State<CustomRoundTextfield> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
//         child: TextFormField(
//           obscureText: widget.isObscure,
//           keyboardType: widget.isOnlyNumber ? TextInputType.number : null,
//           validator: (value) {
//             return widget.validator!();
//           },
//           style: const TextStyle(
//               color: Color.fromARGB(255, 106, 106, 106), fontSize: 16),
//           controller: widget.controller,
//           decoration: InputDecoration(
//             errorMaxLines: 2,
//             contentPadding: const EdgeInsets.only(
//                 left: 20.0, right: 10.0, top: 5.0, bottom: 5.0),
//             hintText: widget.title,
//             hintStyle: const TextStyle(
//               color: Colors.grey,
//             ),
//             filled: true,
//             fillColor: const Color(
//               0xFFF7F9FC,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(
//                 30.0,
//               ),
//               borderSide: const BorderSide(
//                 width: 2,
//                 color: Colors.grey,
//               ),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(
//                 30.0,
//               ),
//               borderSide: const BorderSide(
//                 width: 2,
//                 color: Colors.grey,
//               ),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(
//                 30.0,
//               ),
//               borderSide: const BorderSide(
//                 width: 2,
//                 color: Colors.grey,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(
//                 30.0,
//               ),
//               borderSide: const BorderSide(
//                 width: 2,
//                 color: Colors.grey,
//               ),
//             ),
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomRoundTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;
  final bool isObscure;
  final bool isOnlyNumber;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool autofocus;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final Color fillColor;

  const CustomRoundTextfield({
    super.key,
    required this.controller,
    required this.title,
    required this.validator,
    this.isObscure = false,
    this.isOnlyNumber = false,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.autofocus = false,
    this.padding,
    this.margin,
    this.borderRadius = 2.0,
    this.fillColor = const Color(0xFFF7F9FC),
  });

  @override
  State<CustomRoundTextfield> createState() => _CustomRoundTextfieldState();
}

class _CustomRoundTextfieldState extends State<CustomRoundTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: TextFormField(
        obscureText: widget.isObscure,
        keyboardType:
            widget.isOnlyNumber ? TextInputType.number : widget.keyboardType,
        inputFormatters: widget.isOnlyNumber
            ? [FilteringTextInputFormatter.digitsOnly]
            : widget.inputFormatters,
        validator: widget.validator,
        maxLength: widget.maxLength,
        autofocus: widget.autofocus,
        style: const TextStyle(
          color: Color.fromARGB(255, 106, 106, 106),
          fontSize: 16,
        ),
        controller: widget.controller,
        decoration: InputDecoration(
          errorMaxLines: 2,
          contentPadding: widget.padding ??
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          hintText: widget.title,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: widget.fillColor,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(width: 2, color: Colors.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(width: 2, color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(width: 2, color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(width: 2, color: Colors.blue),
          ),
          counterText: "", // Hides counter for `maxLength`
        ),
      ),
    );
  }
}
