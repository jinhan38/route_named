import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String name = "";
  int age = 0;
  int weight = 0;

  // BuildContext : 특정 위젯의 주소, build 함수에서 완성됨
  // initState는 build 함수보다 먼저 호출됨, 그래서 context 사용 불가
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    // args의 타입(형태)가 Map<String, dynamic> 과 같은지 체크
    if (args is Map<String, dynamic>) {
      name = args["name"];
      age = args["age"];
      weight = args["weight"];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondScreen'),
      ),
      body: Column(
        children: [
          Text(
            "이름 : $name",
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            "나이 : $age",
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            "몸무게 : $weight",
            style: const TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              List<String> data = [
                "안녕하세요",
                "잘 부탁드립니다.",
                "저도요",
                "그렇군요",
              ];
              Navigator.pop(context, data);
            },
            child: const Text("Pop"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/third");
            },
            child: const Text("replace"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            child: const Text("Third"),
          ),
        ],
      ),
    );
  }
}
