import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<String> popData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstScreen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Map<String, dynamic> data = {
                "name": "김진한",
                "age": 35,
                "weight": 75,
              };
              Navigator.pushNamed(
                context,
                "/second",
                arguments: data,
              ).then((value) {
                print('value : $value');

                // value의 타입이 List<String>이라면
                // popData 변수에 모두 옮겨 담아라
                if (value is List<String>) {
                  setState(() {
                    popData.clear();
                    popData.addAll(value);
                  });
                }
              });
            },
            child: Text("go second"),
          ),

          // popData가 2개라는 것을 알고 있는 경우
          if (popData.isNotEmpty) ...[
            Text(
              popData[0],
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              popData[1],
              style: const TextStyle(fontSize: 30),
            ),
          ],

          /// popData 배열의 개수만큼 Text를 반복해서 출력
          for (int i = 0; i < popData.length; i++) ...[
            Text(
              popData[i],
              style: const TextStyle(fontSize: 30),
            ),
          ],

          for (var data in popData)...[
            Text(
              data,
              style: const TextStyle(fontSize: 30),
            ),
          ],

        ],
      ),
    );
  }
}
