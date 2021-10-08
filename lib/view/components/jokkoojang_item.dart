import 'package:flutter/material.dart';
import 'package:flutter_jokkoo/model/jokkoojang.dart';

class JokkoojangItem extends StatelessWidget {
  JokkoojangItem({Key? key, required this.jokkoojang}) : super(key: key);

  Jokkoojang jokkoojang;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.blue,
          ),
        ),
        child: Text(
          jokkoojang.name ?? "",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
