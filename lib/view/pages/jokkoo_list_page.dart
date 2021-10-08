import 'package:flutter/material.dart';

class JokkooListPage extends StatefulWidget {
  JokkooListPage({Key? key}) : super(key: key);

  @override
  _JokkooListPageState createState() => _JokkooListPageState();
}

class _JokkooListPageState extends State<JokkooListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("족구장 목록"),
      ),
      body: Text("ListPage"),
    );
  }
}
