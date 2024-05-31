import 'package:flutter/material.dart';

class TextFieldBody extends StatefulWidget {
  final String label;
  final Widget child;
  final Widget? rightIcon;
  final Function()? onTapRight;
  final EdgeInsets? padding;
  final bool readOnly;
  final String? fontFamily;

  const TextFieldBody({
    this.label = "",
    required this.child,
    this.rightIcon,
    this.onTapRight,
    this.padding,
    this.readOnly = false,
    this.fontFamily,
    super.key,
  });

  @override
  State<TextFieldBody> createState() => _TextFieldBodyState();
}

class _TextFieldBodyState extends State<TextFieldBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.label.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                bottom: 4,
              ),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontFamily: widget.fontFamily,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: widget.readOnly ? Colors.grey.shade400 : Colors.blueGrey,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: widget.child,
                ),
                Visibility(
                  visible: widget.rightIcon != null,
                  child: IconButton(
                    onPressed: widget.onTapRight,
                    icon: widget.rightIcon != null
                        ? widget.rightIcon!
                        : const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.readOnly,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 4,
              ),
              child: Text(
                "Read only",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey.shade300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
