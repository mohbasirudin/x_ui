import 'package:flutter/material.dart';

class PageBuilder extends StatefulWidget {
  final Widget Function(double w, double h)? body;
  final Widget Function(double w, double h)? portrait;
  final Widget Function(double w, double h)? landscape;

  const PageBuilder({
    this.body,
    this.portrait,
    this.landscape,
    super.key,
  });

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (_, orientation) {
        return LayoutBuilder(
          builder: (context, constraints) {
            var w = constraints.maxWidth;
            var h = constraints.maxHeight;
            if (widget.body != null) {
              return widget.body!(w, h);
            }

            if (orientation == Orientation.portrait) {
              return widget.portrait!(w, h);
            } else {
              return widget.landscape!(w, h);
            }
          },
        );
      },
    );
  }
}
