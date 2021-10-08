import 'package:flutter_jokkoo/model/jokkoo_rez.dart';
import 'package:flutter_jokkoo/model/jokkoojang.dart';
import 'package:get/get.dart';

class JokkooController extends GetxController {
  Rx<Jokkoojang> jokkoojang = Rx(Jokkoojang());
  RxList<Jokkoojang> jokkoojangList = RxList();

  Rx<int?> stAbsTime = Rx<int?>(null); //현재예약용
  Rx<int?> endAbsTime = Rx<int?>(null); //현재예약용

  @override
  void onInit() {
    // Dummy Data
    for (int i = 1; i <= 10; i++) {
      jokkoojangList.add(
        Jokkoojang(
          id: i,
          name: "서울족구장$i",
          rezs: [
            JokkooRez(
              id: 1,
              jokkoojangId: i,
              stTime: DateTime.parse("2021-10-08 12:20"),
              endTime: DateTime.parse("2021-10-08 14:20"),
            ),
            JokkooRez(
              id: 2,
              jokkoojangId: i,
              stTime: DateTime.parse("2021-10-08 14:50"),
              endTime: DateTime.parse("2021-10-08 16:20"),
            ),
          ],
        ),
      );
    }
    super.onInit();
  }
}
