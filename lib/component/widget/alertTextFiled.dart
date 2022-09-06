import 'package:flutter/material.dart';

class AlertDialogTextField extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();
  final Function(String?)? onSubmitted;
  final String? hintText;
  final String? title;
  AlertDialogTextField({Key? key, this.onSubmitted, this.hintText, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      content: TextField(
        controller: _textFieldController,
        decoration: InputDecoration(hintText: hintText),
      ),
      actions: [
        new FlatButton(
          child: new Text('SUBMIT'),
          onPressed: () {
            this.onSubmitted!(_textFieldController.text);
          },
        )
      ],
    );
  }
}
