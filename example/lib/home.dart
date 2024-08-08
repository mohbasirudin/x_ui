import 'package:bee_ui/extension/dynamic.dart';
import 'package:bee_ui/extension/widget.dart';
import 'package:bee_ui/helper/padding.dart';
import 'package:bee_ui/view/button/elevated.dart';
import 'package:bee_ui/view/button/icon_data.dart';
import 'package:bee_ui/view/button/outlined.dart';
import 'package:bee_ui/view/button/text.dart';
import 'package:bee_ui/view/filed/autocompleted.dart';
import 'package:bee_ui/view/filed/textfield.dart';
import 'package:bee_ui/view/others/gap.dart';
import 'package:bee_ui/view/text/text.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final fnField = FocusNode();
  final conField = TextEditingController();

  var buahValue = "Apel";
  var data = [
    'Apel',
    'Jeruk',
    'Pisang',
    'Mangga',
    'Anggur',
    'Semangka',
    'Pepaya',
    'Nanas',
    'Stroberi',
    'Kiwi',
    'Melon',
    'Durian',
    'Rambutan',
    'Salak',
    'Sirsak',
    'Manggis',
    'Ceri',
    'Leci',
    'Alpukat',
    'Jambu'
  ];

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          ).center(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BeeText(
                "200000".toCurrency(),
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
              BeeText(
                "200000".toDecimal(),
              ),
            ],
          ),
          BeeTextField(
            label: "Textfield",
            borderRadius: 8,
            padding: paddingBottom(),
            focusNode: fnField,
            controller: conField,
            hint: "ex: John",
            sufficIcon: Icons.visibility,
            onChanged: (v) {},
          ),
          BeeTextField(
            borderRadius: 8,
            padding: paddingBottom(),
            sufficText: "IDR",
            type: TextInputType.number,
          ),
          Row(
            children: [
              BeeAutocompleted(
                label: "Buah",
                value: buahValue,
                data: data,
                onChanged: (value) {
                  buahValue = value;
                  setState(() {});
                },
              ).expanded(),
              const Gap(),
              BeeAutocompleted(
                label: "Autocompleted",
                value: "data",
                buttonText: "Change",
                data: data,
                onChanged: (value) {},
              ).expanded(),
            ],
          ).padding(paddingBottom()),
        ],
      ),
    );
  }
}
