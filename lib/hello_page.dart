import 'package:flutter/material.dart';

class HelloPage extends StatefulWidget {
  // less -> ful 상태가 있는 위젯이 된다

  HelloPage({Key? key}) : super(key: key);

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  int num = 1;

  // int로 지정해서 cons 를 지움
  @override
  Widget build(BuildContext context) {
    // build를 다시 호출 할 수 없다(build가 지워지고 다시그려진다)
    // build의 권한은 없다
    print("실행?");
    return Scaffold(
      // return 부분은 계속 실행 될 수 있다 (계속 다시 그림을 그린다)
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            NewWidget(num: num),
            ElevatedButton(
              onPressed: () {
                setState(() { // stateful 상태에서만 사용이 가능하다
                  // 변경하고 싶은 상태 값을 여기서 rebuild 해준다
                  num++;
                });
                print("num : ${num}");
              },
              child: Text("변경", style: TextStyle(fontSize: 50)),
            )
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.num,
  });

  final int num;

  @override
  Widget build(BuildContext context) {
    return Text(
      "hello ${num}",
      style: TextStyle(fontSize: 50),
    );
  }
}
