import 'package:flutter/material.dart';
import 'package:flutter_jokkoo/binding/app_binding.dart';
import 'package:flutter_jokkoo/view/pages/jokkoo_list_page.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      home: JokkooListPage(),
    );
  }
}
