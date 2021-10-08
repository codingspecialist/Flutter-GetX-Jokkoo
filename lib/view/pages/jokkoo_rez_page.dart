import 'package:flutter/material.dart';
import 'package:flutter_jokkoo/controller/jokkoo_controller.dart';
import 'package:flutter_jokkoo/model/jokkoo_rez.dart';
import 'package:flutter_jokkoo/view/components/custom_elevated_button.dart';
import 'package:flutter_jokkoo/view/components/jokkoojang_rez_header.dart';
import 'package:get/get.dart';

class JokkooRezPage extends StatelessWidget {
  JokkooRezPage(this.date);

  JokkooController _controller = Get.find<JokkooController>();
  DateTime date;

  // 다음페이지로 넘어갈 때 예약정보 날짜로 변환
  DateTime absMinToDateTime(int absMin) =>
      DateTime(date.year, date.month, date.day, absMin ~/ 60, absMin % 60);

  Widget _labelText(String text, {TextAlign? textAlign}) => Text(
        "$text",
        textAlign: textAlign ?? TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _girdViewHeader() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: Row(
          children: List.generate(
            7,
            (i) => Expanded(
              child: Container(
                transform:
                    Matrix4.translationValues(10, 0, 0), //오른쪽으로 땡겨야 끝에 맞춰짐
                child: _labelText("${i * 10}", textAlign: TextAlign.end),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top), //StatusBar
          JokkoojangRezHeader(today: date),
          _girdViewHeader(),
          // 시간 텍스트도 함께 넣은이유 : 헤더와 정렬위해서
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, // 1행 item cnt
                childAspectRatio: 1, // item 가로세로비율
                mainAxisSpacing: 5, // 수평 Padding
                crossAxisSpacing: 5, // 수직 Padding
              ),
              itemCount: 168, // 라벨포함
              itemBuilder: (context, index) {
                // y축 범례일 경우에는 미리 리턴을 하여 아래의 불필요한 연산 줄이자
                if (index % 7 == 0) {
                  return Container(
                    alignment: Alignment.center,
                    child: _labelText("${(index / 7).floor()}"),
                  );
                }

                RezState state = RezState.ABLE;

                return GestureDetector(
                  onTap: () {},
                  child: Container(color: state.color),
                );
              },
            ),
          ),

          CustomElevatedButton(
            text: "다음",
            onPressed: () {
              DateTime s = absMinToDateTime(_controller.stAbsTime.value ?? 0);
              DateTime e = absMinToDateTime(_controller.endAbsTime.value ?? 0);
              Get.snackbar("에약일정", "$s ~\n $e");
            },
          ),
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
