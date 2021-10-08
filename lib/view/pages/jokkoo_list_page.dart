import 'package:flutter/material.dart';
import 'package:flutter_jokkoo/controller/jokkoo_controller.dart';
import 'package:flutter_jokkoo/model/jokkoo_rez.dart';
import 'package:flutter_jokkoo/model/jokkoojang.dart';
import 'package:flutter_jokkoo/view/components/jokkoojang_item.dart';
import 'package:flutter_jokkoo/view/pages/jokkoo_rez_page.dart';
import 'package:get/get.dart';

class JokkooListPage extends StatefulWidget {
  JokkooListPage({Key? key}) : super(key: key);

  @override
  _JokkooListPageState createState() => _JokkooListPageState();
}

class _JokkooListPageState extends State<JokkooListPage> {
  JokkooController _controller = Get.find<JokkooController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("족구장 목록"),
      ),
      body: Obx(
        () => ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: _controller.jokkoojangList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _controller.jokkoojang.value =
                    _controller.jokkoojangList[index];
                _controller.stAbsTime.value = null;
                _controller.endAbsTime.value = null;
                Get.to(() => JokkooRezPage(DateTime.now()));
              },
              child: JokkoojangItem(
                jokkoojang: _controller.jokkoojangList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
