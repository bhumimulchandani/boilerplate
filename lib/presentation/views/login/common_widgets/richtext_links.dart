import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextLinks extends StatelessWidget {
  final String prefixText;
  final String actionText;
  final TextStyle prefixStyle;
  final TextStyle actionStyle;
  final VoidCallback onActionTap;

  const RichTextLinks({
    super.key,
    required this.prefixText,
    required this.actionText,
    required this.prefixStyle,
    required this.actionStyle,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: prefixText,
        style: prefixStyle,
        children: [
          TextSpan(
            text: actionText,
            style: actionStyle,
            recognizer: TapGestureRecognizer()..onTap = onActionTap,
          ),
        ],
      ),
    );
  }
}
