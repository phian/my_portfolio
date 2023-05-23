import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color? dividerColor;

  const HeaderWidget({
    Key? key,
    required this.title,
    this.titleStyle,
    this.dividerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        // const SizedBox(width: 32.0),
        const Expanded(child: Divider(color: Colors.white38)),
      ],
    );
  }
}
