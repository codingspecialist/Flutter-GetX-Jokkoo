import 'package:flutter/material.dart';

import 'package:flutter_jokkoo/view/components/jokkoojang_rez_header.dart';

class JokkooRezPage extends StatelessWidget {
  JokkooRezPage(this.date);

  DateTime date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top), //StatusBar
          JokkoojangRezHeader(today: date),
        ],
      ),
    );
  }
}

enum RezState {
  EXIST,
  ABLE,
  CHOOSED,
}

extension RezStateExtension on RezState {
  Color get color {
    switch (this) {
      case RezState.EXIST:
        return Colors.pink[50]!;
      case RezState.ABLE:
        return Colors.grey;
      case RezState.CHOOSED:
        return Colors.green[100]!;
    }
  }
}

extension DateTimeExtenstion on DateTime? {
  int get toAbsMin => this == null ? -1 : this!.hour * 60 + this!.minute;
}
