import 'package:bee_ui/view/others/gap.dart';
import 'package:flutter/material.dart';

class BeeListSeparated extends StatefulWidget {
  final int count;
  final EdgeInsets? padding;
  final Widget Function(BuildContext _, int index) itemBuilder;
  final Widget? separator;
  final bool enableScrolling;

  const BeeListSeparated({
    required this.count,
    this.padding,
    required this.itemBuilder,
    this.separator,
    this.enableScrolling = true,
    super.key,
  });

  @override
  State<BeeListSeparated> createState() => _BeeListSeparatedState();
}

class _BeeListSeparatedState extends State<BeeListSeparated> {
  @override
  Widget build(BuildContext context) {
    var canScroll = widget.enableScrolling;

    return ListView.separated(
      itemBuilder: widget.itemBuilder,
      separatorBuilder: (context, index) => widget.separator ?? const Gap(),
      itemCount: widget.count,
      padding: widget.padding,
      shrinkWrap: !canScroll,
      physics: canScroll
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
    );
  }
}
