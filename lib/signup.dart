import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_test_app/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController uidController;
  late TextEditingController upasswordController;
  late TextEditingController upasswordController2;
  late TextEditingController unameController;
  late TextEditingController uemailController;
  late TextEditingController uphoneController;

  @override
  void initState() {
    super.initState();

    uidController = TextEditingController();
    upasswordController = TextEditingController();
    upasswordController2 = TextEditingController();
    unameController = TextEditingController();
    uemailController = TextEditingController();
    uphoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  width: 350,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 250,
                                child: TextField(
                                  controller: uidController,
                                  decoration: const InputDecoration(
                                    labelText: "아이디를 입력하세요.",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                child: TextField(
                                  controller: upasswordController,
                                  decoration: const InputDecoration(
                                    labelText: "비밀번호를 입력하세요.",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                child: TextField(
                                  controller: upasswordController2,
                                  decoration: const InputDecoration(
                                    labelText: "비밀번호를 한번 더 입력하세요.",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                child: TextField(
                                  controller: unameController,
                                  decoration: const InputDecoration(
                                    labelText: "이름을 입력하세요.",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                child: TextField(
                                  controller: uphoneController,
                                  decoration: const InputDecoration(
                                    labelText: "전화번호를 입력하세요.",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 250,
                                child: TextField(
                                  controller: uemailController,
                                  decoration: const InputDecoration(
                                    labelText: "이메일을 입력하세요.",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 120, 0, 0),
                            child: ElevatedButton(
                              onPressed: () {
                                //checkID();
                                Get.to(const Home());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue, // 버튼 배경색
                                foregroundColor: Colors.white, // 버튼 글씨색
                                minimumSize: const Size(50, 35),
                                shape: RoundedRectangleBorder(
                                  //  버튼 모양 깎기
                                  borderRadius:
                                      BorderRadius.circular(20), // 10은 파라미터
                                ),
                              ),
                              child: const Text(
                                "Check",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //insertAction();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // 버튼 배경색
                    foregroundColor: Colors.white, // 버튼 글씨색
                    minimumSize: const Size(300, 35),
                    shape: RoundedRectangleBorder(
                      //  버튼 모양 깎기
                      borderRadius: BorderRadius.circular(30), // 5 파라미터
                    ),
                  ),
                  child: const Text(
                    "Register",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
