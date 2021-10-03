import 'package:flutter/material.dart';
import 'package:mwslat/theme/sharedcolor.dart';
import 'package:mwslat/theme/sharedfontstyle.dart';

ListTile fields(String title, String hint, TextInputType textInputType, TextEditingController controller, Key key, {bool secure = false, Widget suffix = const SizedBox()}) {
  return ListTile(
    title: Text('$title', style: primaryTextStyle),
    subtitle: Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 50.0,
      child: TextFormField(
        key: key,
        validator: (value) {
          if(value!.isEmpty) {
            return 'This Field Required';
          }
        },
        decoration: InputDecoration(
          border: outlineInputBorder(secondaryColor),
          focusedBorder: outlineInputBorder(secondaryColor),
          errorBorder: outlineInputBorder(Colors.red),
          hintText: '$hint',
          hintStyle: secondaryTextStyle,
          suffixIcon: suffix
        ),
        keyboardType: textInputType,
        textInputAction: TextInputAction.done,
        controller: controller,
        obscureText: secure,
      ),
    ),
  );
}

OutlineInputBorder outlineInputBorder(Color color) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: color, width: 1.5)
    );
}



customField(String title, String hint, TextInputType textInputType, TextEditingController controller, Key key, Function onSubmit, {bool secure = false, Widget suffix = const SizedBox()}) {
  return TextFormField(
    key: key,
    validator: (value) {
      if(value!.isEmpty) {
        return 'This Field Required';
      }
    },
    decoration: InputDecoration(
      border: outlineInputBorder(secondaryColor),
      focusedBorder: outlineInputBorder(secondaryColor),
      errorBorder: outlineInputBorder(Colors.red),
      hintText: '$hint',
      hintStyle: secondaryTextStyle,
      suffixIcon: suffix
    ),
    keyboardType: textInputType,
    textInputAction: TextInputAction.done,
    controller: controller,
    obscureText: secure,
    onFieldSubmitted: (value) {
      onSubmit();
    },
  );
}