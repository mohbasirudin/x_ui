import 'package:bee_ui/init.dart';
import 'package:flutter/material.dart';
import 'package:x_ui_example/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await BeeUi().initialized(
    primaryColor: Colors.blue,
    buttonHeight: 48,
  );

  runApp(const MaterialApp(
    home: PageHome(),
  ));
}
