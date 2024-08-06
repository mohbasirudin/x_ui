import 'package:bee_ui/extension/widget.dart';
import 'package:bee_ui/helper/padding.dart';
import 'package:bee_ui/view/button/elevated.dart';
import 'package:bee_ui/view/button/icon_data.dart';
import 'package:bee_ui/view/button/outlined.dart';
import 'package:bee_ui/view/button/text.dart';
import 'package:bee_ui/view/filed/textfield.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final fnField = FocusNode();
  final conField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Bee UI"),
      ),
      body: ListView(
        padding: paddingAll(),
        children: [
          BeeButtonElevated(
            "Button Elevated",
            onTap: () {},
            padding: paddingBottom(),
          ),
          BeeButtonOutlined(
            "Button Outlined",
            onTap: () {},
            padding: paddingBottom(),
          ),
          Row(
            children: [
              BeeButtonIcon(
                Icons.add,
                onTap: () {},
              ),
            ],
          ).padding(paddingBottom()),
          BeeButtonText(
            "Button Text",
            onTap: () {},
            padding: paddingBottom(),
          ),
          BeeTextfield(
            label: "Textfield",
            borderRadius: 8,
            padding: paddingBottom(),
            focusNode: fnField,
            controller: conField,
            hint: "ex: John",
            sufficIcon: Icons.visibility,
            onChanged: (v) {},
          ),
          BeeTextfield(
            borderRadius: 8,
            padding: paddingBottom(),
            sufficText: "IDR",
          ),
        ],
      ),
    );
  }
}
