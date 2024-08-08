import 'package:flutter/material.dart';

class BeeButtonClose extends StatefulWidget {
  const BeeButtonClose({super.key});

  @override
  State<BeeButtonClose> createState() => _BeeButtonCloseState();
}

class _BeeButtonCloseState extends State<BeeButtonClose> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.close,
      ),
    );
  }
}
