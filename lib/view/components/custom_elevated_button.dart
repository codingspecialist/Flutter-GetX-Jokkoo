import 'package:flutter/material.dart';
import 'package:flutter_jokkoo/model/jokkoojang.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  Function()? onPressed;
  CustomElevatedButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.pink[100],
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )),
        ),
        onPressed: onPressed,
        child: Container(
          width: 150,
          alignment: Alignment.center,
          child: Text(text),
        ),
      ),
    );
  }
}
