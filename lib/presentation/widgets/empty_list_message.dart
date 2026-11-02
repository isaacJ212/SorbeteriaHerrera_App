import 'package:flutter/material.dart';

class EmptyListMessage extends StatelessWidget {
  final String message;

  const EmptyListMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, color: Color(0xFF64736D)),
        ),
      ),
    );
  }
}
