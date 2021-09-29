import 'package:flutter/material.dart';



SnackBar snack(String content, Color color) {
  return SnackBar(
    content: Text('$content'),
    backgroundColor: color,
    duration: Duration(seconds: 4),
  );
}
