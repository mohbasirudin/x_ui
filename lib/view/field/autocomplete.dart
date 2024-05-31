import 'package:flutter/material.dart';
import 'package:x_ui/helper/colors.dart';
import 'package:x_ui/helper/ext_num.dart';
import 'package:x_ui/helper/helper.dart';
import 'package:x_ui/helper/padding.dart';
import 'package:x_ui/storage/pref.dart';
import 'package:x_ui/view/field/body.dart';
import 'package:x_ui/view/field/textfield.dart';

class CAutocomplete extends StatefulWidget {
  final String label;
  final String hint;
  final String initialValue;
  final Function(String value) onChange;
  final TextInputType? type;
  final double? fontSize;
  final EdgeInsets? padding;
  final bool readOnly;
  final bool saveHistory;
  final bool showHistory;
  final List<String> data;

  const CAutocomplete({
    this.label = "",
    this.hint = "",
    this.initialValue = "",
    required this.onChange,
    this.type,
    this.fontSize,
    this.padding,
    this.readOnly = false,
    this.saveHistory = false,
    this.showHistory = false,
    required this.data,
    super.key,
  });

  @override
  State<CAutocomplete> createState() => _CAutocompleteState();
}

class _CAutocompleteState extends State<CAutocomplete> {
  var value = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldBody(
      readOnly: widget.readOnly,
      padding: widget.padding,
      label: widget.label,
      child: GestureDetector(
        onTap: () {
          if (widget.readOnly) return;

          if (widget.data.isEmpty) return;

          openDialog(context);
        },
        child: Text(value),
      ),
    );
  }

  void openDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return _DialogAutocomplete(
          data: widget.data,
          label: widget.label,
          saveHistory: widget.saveHistory,
          showHistory: widget.showHistory,
          onChange: widget.onChange,
        );
      },
    );
  }
}

class _DialogAutocomplete extends StatefulWidget {
  final List<String> data;
  final String label;
  final bool saveHistory;
  final bool showHistory;
  final Function(String value) onChange;

  const _DialogAutocomplete({
    required this.data,
    required this.label,
    this.saveHistory = false,
    this.showHistory = false,
    required this.onChange,
  });

  @override
  State<_DialogAutocomplete> createState() => _DialogAutocompleteState();
}

class _DialogAutocompleteState extends State<_DialogAutocomplete> {
  List<ModelItem> _datas = [];
  List<ModelItem> _localDatas = [];
  String _search = "";
  double _iconSize = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
    _iconSize = 5.w();
  }

  Future<void> _init() async {
    var key = PrefKeys.list(widget.label);
    var locals = await PrefStorage.storeList(key);
    // var _locals = <ModelItem>[];
    if (_datas.isNotEmpty) _datas.clear();
    if (_localDatas.isNotEmpty) _localDatas.clear();
    for (var i = 0; i < locals.length; i++) {
      var local = locals[i];
      var item = ModelItem(name: local, local: true);
      // _locals.add(item);

      _localDatas.add(item);
      _datas.add(item);
    }
    // _localDatas = _locals;
    // _datas = _locals;
    // _datas = _localDatas;
    setState(() {});
  }

  void _onFilter(String value) async {
    var datas = widget.data;

    if (value.isEmpty) {
      _datas.clear();
      await _init();
      return;
    }
    _search = value;
    _datas.clear();
    logs(_localDatas.length);
    for (var i = 0; i < _localDatas.length; i++) {
      var local = _localDatas[i].name.toLowerCase();
      logs("masuk local > $local == $value");
      if (local.contains(value)) {
        var item = ModelItem(name: _localDatas[i].name, local: true);
        _datas.add(item);
      }
    }

    for (var i = 0; i < datas.length; i++) {
      var data = datas[i].toLowerCase();
      if (data.contains(value)) {
        var item = ModelItem(name: datas[i], local: false);
        _datas.add(item);
      }
    }

    setState(() {});
  }

  void _onSubmit(
    ModelItem data, {
    required Function() onClose,
  }) async {
    var value = data.name;
    if (widget.saveHistory && !data.local) {
      var key = PrefKeys.list(widget.label);
      var locals = await PrefStorage.storeList(key);
      var isExist = locals.contains(value);
      if (!isExist) {
        locals.add(value);
      }
      await PrefStorage.saveList(key, locals);
    }

    widget.onChange(value);
    onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.label),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Column(
        children: [
          CTextField(
            autoFocus: true,
            hint: widget.label,
            onChange: (value) {
              _onFilter(value);
            },
            padding: EdgeInsets.all(12),
          ),
          Expanded(
            child: _datas.isNotEmpty
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return _item(index);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 24,
                        color: Colors.grey.shade300,
                      );
                    },
                    itemCount: _datas.length,
                    padding: EdgeInsets.all(12),
                  )
                : Center(
                    child: Text(
                      "Data not found!",
                      style: TextStyle(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _item(int index) {
    var data = _datas[index];
    var isLocal = data.local;
    return Row(
      children: [
        Padding(
          padding: padRight(8),
          child: Center(
            child: Icon(
              isLocal ? Icons.history_outlined : Icons.search_outlined,
              color: Colors.blueGrey,
              size: _iconSize,
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              _onSubmit(
                data,
                onClose: () {
                  Navigator.pop(context);
                },
              );
            },
            child: Text(
              data.name,
            ),
          ),
        ),
        Padding(
          padding: padLeft(8),
          child: isLocal
              ? GestureDetector(
                  onTap: () async {
                    try {
                      logs("index $index");
                      _localDatas.removeAt(index);
                      _datas.removeAt(index);
                      var locals = <String>[];
                      for (var i = 0; i < _localDatas.length; i++) {
                        locals.add(_localDatas[i].name);
                      }
                      await PrefStorage.saveList(
                        PrefKeys.list(widget.label),
                        locals,
                      );
                      setState(() {});
                    } catch (e) {
                      logs(e);
                    }
                  },
                  child: Text(
                    "Clear",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              : Icon(
                  Icons.keyboard_arrow_right,
                  // color: XColors.disabled,
                  color: Colors.blueGrey,
                ),
        ),
      ],
    );
  }
}

class ModelItem {
  final String name;
  final bool local;

  const ModelItem({
    this.name = "",
    this.local = false,
  });
}
