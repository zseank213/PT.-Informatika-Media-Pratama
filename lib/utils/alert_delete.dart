import 'package:flutter/material.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class Alert extends StatefulWidget {
  final ValueSetter<bool> callback;
  final String content;
  String? textButtonNext;

  Alert({
    Key? key,
    required this.callback,
    required this.content,
    this.textButtonNext,
  }) : super(key: key);

  @override
  State<Alert> createState() => _AlertDeleteState();
}

class _AlertDeleteState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(widget.content),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            widget.callback(false);
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: textNormal(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () async {
            widget.callback(true);
            Navigator.pop(context);
          },
          child: Text(
            widget.textButtonNext ?? "Ok",
            style: textNormal(color: bluePrimary),
          ),
        ),
      ],
    );
  }
}
