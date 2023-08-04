import 'package:flutter/material.dart';
import 'package:project_test_app/model/message.dart';

class Btn extends StatefulWidget {
  const Btn({super.key});

  @override
  State<Btn> createState() => _BtnState();
}

class _BtnState extends State<Btn> {

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: Message.result,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Message.result=!Message.result;
              setState(() {
                
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent, // 버튼 배경색
              foregroundColor: Colors.white, // 버튼 글씨색
              shape: RoundedRectangleBorder(
                //  버튼 모양 깎기
                borderRadius: BorderRadius.circular(10), // 10은 파라미터
              ),
            ),
            child: const Text(
              "Elevated Button",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print("Elevated Button");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent, // 버튼 배경색
              foregroundColor: Colors.white, // 버튼 글씨색
              shape: RoundedRectangleBorder(
                //  버튼 모양 깎기
                borderRadius: BorderRadius.circular(10), // 10은 파라미터
              ),
            ),
            child: const Text(
              "Elevated Button",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print("Elevated Button");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent, // 버튼 배경색
              foregroundColor: Colors.white, // 버튼 글씨색
              shape: RoundedRectangleBorder(
                //  버튼 모양 깎기
                borderRadius: BorderRadius.circular(10), // 10은 파라미터
              ),
            ),
            child: const Text(
              "Elevated Button",
            ),
          ),
        ],
      ),
    );
  }
}
