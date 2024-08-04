import 'package:bee_ui/helper/padding.dart';
import 'package:bee_ui/view/button/elevated.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: ListView(
        padding: paddingAll(12),
        children: [
          BeeButtonElevated(
            "Button Elevated",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
