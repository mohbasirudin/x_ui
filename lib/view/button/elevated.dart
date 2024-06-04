import 'package:flutter/material.dart';
import 'package:x_ui/helper/colors.dart';
import 'package:x_ui/helper/helper.dart';
import 'package:x_ui/helper/padding.dart';

class CButtonElevated extends StatefulWidget {
  final String text;
  final Function() onTap;
  final bool enabled;
  final EdgeInsets? padding;
  final double? radius;
  final bool rounded;

  const CButtonElevated({
    required this.text,
    required this.onTap,
    this.enabled = true,
    this.padding,
    this.radius,
    this.rounded = false,
    super.key,
  });

  @override
  State<CButtonElevated> createState() => _CButtonElevatedState();
}

class _CButtonElevatedState extends State<CButtonElevated> {
  @override
  Widget build(BuildContext context) {
    var enabled = widget.enabled;
    return Padding(
      padding: widget.padding ?? padZero(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          widget.radius ?? 0,
        ),
        child: Material(
          color: enabled ? XColors.enable : XColors.disabled,
          child: InkWell(
            splashColor: Colors.blue.withOpacity(0.1),
            onTap: enabled ? widget.onTap : null,
            child: SizedBox(
              height: buttonHeight(),
              width: double.infinity,
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.medium(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
