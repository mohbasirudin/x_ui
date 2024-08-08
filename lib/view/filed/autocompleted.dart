import 'package:bee_ui/extension/number.dart';
import 'package:bee_ui/extension/string.dart';
import 'package:bee_ui/extension/widget.dart';
import 'package:bee_ui/helper/func.dart';
import 'package:bee_ui/helper/helper.dart';
import 'package:bee_ui/helper/padding.dart';
import 'package:bee_ui/helper/radius.dart';
import 'package:bee_ui/view/button/close.dart';
import 'package:bee_ui/view/filed/textfield.dart';
import 'package:bee_ui/view/list/separated.dart';
import 'package:bee_ui/view/others/label_field.dart';
import 'package:bee_ui/view/text/text.dart';
import 'package:flutter/material.dart';

class BeeAutocompleted extends StatefulWidget {
  final String label;
  final String value;
  final EdgeInsets? padding;
  final String? buttonText;
  final bool enabled;
  final Color? buttonColor;
  final List<String> data;
  final Function(String value) onChanged;

  const BeeAutocompleted({
    this.label = "",
    this.value = "",
    this.padding,
    this.buttonText,
    this.enabled = true,
    this.buttonColor,
    required this.data,
    required this.onChanged,
    super.key,
  });

  @override
  State<BeeAutocompleted> createState() => _BeeAutocompletedState();
}

class _BeeAutocompletedState extends State<BeeAutocompleted> {
  final _helper = Helper();
  var data = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    var enabled = widget.enabled;
    var buttonColor = widget.buttonColor ?? _helper.getPrimaryColor();
    var color = enabled ? buttonColor : _helper.getDisabledColor();

    Widget icon = Icon(
      Icons.arrow_drop_down_rounded,
      color: color,
    );
    if (widget.buttonText != null) {
      icon = BeeText(
        widget.buttonText ?? "",
        color: color,
        fontSize: 14,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CLabelField(widget.label),
        Container(
          height: _helper.getButtonHeight(),
          padding: paddingHorizontal(),
          decoration: BoxDecoration(
            borderRadius: radiusAll(),
            border: Border.all(
              color: _helper.getOutlinedColor(),
            ),
          ),
          child: Row(
            children: [
              BeeText(widget.value).expanded(),
              icon,
            ],
          ),
        ),
      ],
    )
        .onTap(
          () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              isDismissible: false,
              builder: (context) => _Menu(
                widget.label,
                data,
                _helper,
                widget.value,
                onChanged: widget.onChanged,
              ),
            );
          },
        )
        .padding(widget.padding)
        .show(data.isNotEmpty);
  }
}

class _Menu extends StatefulWidget {
  final String label;
  final List<String> data;
  final Helper helper;
  final String value;
  final Function(String value) onChanged;

  const _Menu(
    this.label,
    this.data,
    this.helper,
    this.value, {
    required this.onChanged,
    super.key,
  });

  @override
  State<_Menu> createState() => _MenuState();
}

class _MenuState extends State<_Menu> {
  late Helper helper;
  var data = <String>[], dataSearch = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = widget.data;
    helper = widget.helper;
    logs(name: "auto", message: data);
  }

  void _setData(String search) {
    search = search.lower();
    if (dataSearch.isNotEmpty) dataSearch.clear();

    if (search.isNotEmpty) {
      for (var i = 0; i < data.length; i++) {
        var d = data[i];
        logs(name: "search", message: "$d == $search");
        if (d.lower().contains(search)) {
          dataSearch.add(d);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BeeText(
          widget.label.isNotEmpty ? widget.label : "Menu",
          maxLines: 1,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        actions: const [
          BeeButtonClose(),
        ],
      ),
      body: Column(
        children: [
          BeeTextField(
            hint: "Search",
            borderRadius: 8,
            onChanged: _setData,
            padding: paddingAll(),
          ),
          BeeListSeparated(
            count: dataSearch.length,
            itemBuilder: (_, index) => _item(index),
            padding: paddingAll(),
          ).expanded(),
        ],
      ),
    );
  }

  Widget _item(int index) {
    var selected = dataSearch[index].lower() == widget.value.lower();
    var outlinedColor =
        selected ? helper.getPrimaryColor() : helper.getOutlinedColor();
    return Container(
      padding: paddingSymmetric(
        vertical: 4,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: selected ? helper.getPrimaryColor() : Colors.white,
        borderRadius: radiusAll(),
        border: Border.all(
          color: outlinedColor.withOpacity(0.5),
          width: helper.getOutlinedSize().scale(0.75),
        ),
      ),
      child: Row(
        children: [
          BeeText(
            dataSearch[index],
            color: selected ? Colors.white : helper.getTextColor(),
          ).expanded(),
          Icon(
            Icons.arrow_right,
            size: 14,
            color: selected ? Colors.white : outlinedColor,
          ),
        ],
      ),
    ).onTap(
      () {
        if (selected) return;
        widget.onChanged(dataSearch[index]);
        Navigator.pop(context);
      },
    );
  }
}
