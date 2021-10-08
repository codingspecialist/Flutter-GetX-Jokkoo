// 족구장 모델 - 족구장의 정보와 예약정보를 담고있다
import 'package:flutter_jokkoo/model/jokkoo_rez.dart';

class Jokkoojang {
  int? id;
  String? name;
  List<JokkooRez>? rezs;

  Jokkoojang({this.id, this.name, this.rezs});
}
