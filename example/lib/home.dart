import 'package:flutter/material.dart';
import 'package:x_ui/helper/ext_num.dart';
import 'package:x_ui/helper/helper.dart';
import 'package:x_ui/helper/padding.dart';
import 'package:x_ui/view/button/elevated.dart';
import 'package:x_ui/view/field/textfield.dart';
import 'package:x_ui/view/field/fullscreen.dart';
import 'package:x_ui/view/field/number.dart';
import 'package:x_ui/view/field/autocomplete.dart';
import 'package:x_ui/view/page/builder.dart';
import 'package:x_ui_example/dummy.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    print("ini home");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
      body: PageBuilder(
        body: (w, h) => _body(),
      ),
    );
  }

  Widget _body() {
    logs("width: ${width()} , ${XFontSize.medium()}");
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: padAll(56),
            child: Text(
              "12",
              style: TextStyle(
                fontSize: XFontSize.medium(),
              ),
            ),
          ),
          CButtonElevated(),
          CAutocomplete(
            onChange: (value) {
              logs(value);
            },
            data: Dummy.fruits,
            initialValue: Dummy.fruits[0],
            padding: EdgeInsets.all(12),
            label: "Fruit",
            saveHistory: true,
            showHistory: true,
          ),
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
    );
  }
}
