import 'package:flutter/material.dart';

class CButtonElevated extends StatefulWidget {
  const CButtonElevated({super.key});

  @override
  State<CButtonElevated> createState() => _CButtonElevatedState();
}

class _CButtonElevatedState extends State<CButtonElevated> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Material(
        color: Colors.blue,
        child: InkWell(
          splashColor: Colors.blue.withOpacity(0.1),
          onTap: () {
          },
          child: SizedBox(
            height: 48,
            width: double.infinity,
            child: Center(
              child: Text("Submit",style: TextStyle(
                color: Colors.white,
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
