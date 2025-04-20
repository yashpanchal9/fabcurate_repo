import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String text;

  const CustomRichText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final splitIndex = text.indexOf('FOR');

    if (splitIndex == -1) {
      return Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ),
      );
    }

    final beforeFor = text.substring(0, splitIndex + 3);
    final afterFor = text.substring(splitIndex + 3).trim();

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$beforeFor ',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5,
            ),
          ),
          TextSpan(
            text: afterFor,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
