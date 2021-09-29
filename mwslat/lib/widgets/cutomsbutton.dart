import 'package:flutter/material.dart';
import 'package:mwslat/theme/sharedcolor.dart';

class CustomButton extends StatefulWidget {
  final String txt;
  final Function onTap;

  CustomButton(this.txt, this.onTap);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        child: Text('${widget.txt}',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            backgroundColor: blackColor,
            fixedSize: Size(MediaQuery.of(context).size.width / 1.1, 40.0)),
        onPressed: () {
          widget.onTap();
        },
      ),
    );
  }
}
