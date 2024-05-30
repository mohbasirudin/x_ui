// import 'package:flutter/material.dart';
// import 'package:x_ui/const.dart';
// import 'package:x_ui/styles.dart';
//
// class XButtonElevated extends StatefulWidget {
//   final EdgeInsets padding;
//   final String text;
//   final Function()? onTap;
//   final bool enable;
//   final double width;
//   final double height;
//   final Color colorText;
//   final double fontSize;
//   final Color colorEnable;
//   final Color colorDisable;
//
//   const XButtonElevated({
//     super.key,
//     required this.text,
//     this.padding = EdgeInsets.zero,
//     this.onTap,
//     this.enable = true,
//     this.width = BaseData.buttonWidth,
//     this.height = BaseData.buttonHeight,
//     this.colorText = BaseColor.btnText,
//     this.fontSize = FontSize.medium,
//     this.colorEnable = BaseColor.enable,
//     this.colorDisable = BaseColor.disable,
//   });
//
//   @override
//   State<XButtonElevated> createState() => _XButtonElevatedState();
// }
//
// class _XButtonElevatedState extends State<XButtonElevated> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: widget.padding,
//       child: InkWell(
//         onTap: widget.onTap,
//         child: Material(
//           color: widget.enable ? widget.colorEnable : widget.colorDisable,
//           child: SizedBox(
//             width: widget.width,
//             height: widget.height,
//             child: Center(
//               child: Text(
//                 widget.text,
//                 style: StyleText.btn(
//                   color: widget.enable
//                       ? widget.colorText
//                       : BaseColor.btnTextDisable,
//                   fontSize: widget.fontSize,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
