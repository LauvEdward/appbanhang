import 'package:flutter/material.dart';

class SahaTextField extends StatefulWidget {
  final String labelText;
  final bool withAsterisk;
  final String? suffix;
  final Icon? icon;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;
  final Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final bool? obscureText;
  final bool? autoFocus;
  final TextInputType? textInputType;
  final String? hintText;
  final int? maxLength;
  final int? maxLine;

  const SahaTextField(
      {Key? key,
      required this.labelText,
      this.withAsterisk = false,
      this.suffix,
      this.icon,
      this.controller,
      this.onChanged,
      this.onSubmitted,
      this.validator,
      this.obscureText = false,
      this.textInputType,
      this.hintText,
      this.maxLength,
      this.maxLine,
      this.autoFocus = false,
      this.textCapitalization})
      : super(key: key);

  @override
  _SahaTextFieldState createState() => _SahaTextFieldState();
}

class _SahaTextFieldState extends State<SahaTextField> {
  var _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: EdgeInsets.fromLTRB(10, 15 , 10, 10),
        child: TextFormField(
          validator: widget.validator as String? Function(String?)?,
          keyboardType: widget.textInputType,
          onChanged: widget.onChanged,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          onFieldSubmitted: widget.onSubmitted,
          obscureText: widget.obscureText == false ? false : !_passwordVisible,
          controller: widget.controller,
          maxLength: widget.maxLength,
          autofocus: widget.autoFocus!,
          maxLines: widget.maxLine,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(6),
            labelText: widget.labelText,
            labelStyle: TextStyle(
              fontSize: 14
            ),
            suffixIcon: widget.obscureText == true
                ? IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.grey[400]!,
                width: 1.0,
              ),
            ),
            hintText: widget.hintText,
          ),
        ),
      ),
    ]);
  }
}
