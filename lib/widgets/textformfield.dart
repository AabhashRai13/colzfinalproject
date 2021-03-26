import 'package:flutter/material.dart';

class TextFieldform extends StatelessWidget {
  const TextFieldform({
    Key key,
    @required this.email,
    @required this.hinttext,
    @required this.textInputType,
    this.validator,

  }) : super(key: key);

  final Function validator;
  final TextEditingController email;
  final String hinttext;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: validator,
        controller: email,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color:Colors.grey,
                    width: 1
                ),
                borderRadius: BorderRadius.circular(16.0)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Colors.red,
                    width: 1
                ),
                borderRadius: BorderRadius.circular(16.0)
            ),
            hintText: hinttext,
            hintStyle: TextStyle(
                color: Colors.grey
            )
        ),
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,

      ),
    );
  }
}
