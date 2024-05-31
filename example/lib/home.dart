import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_ui/view/field/textfield.dart';
import 'package:x_ui/view/field/fullscreen.dart';
import 'package:x_ui/view/field/number.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CTextField(
              label: "Note",
              initialValue: "Apa",
              onChange: (value) {
                print("change: $value");
              },
              padding: EdgeInsets.all(12),
              readOnly: true,
            ),
            CTextFieldNumber(
              label: "Price",
              padding: EdgeInsets.all(12),
              initialValue: "12000",
              digits: 2,
              onChange: (value) {
                print("number: $value");
              },
              readOnly: true,
            ),
            CTextFieldFullscreen(
              label: "Note",
              initialValue: "ini baru",
              onChange: (value) {
                print("change: $value");
              },
              padding: EdgeInsets.all(12),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
