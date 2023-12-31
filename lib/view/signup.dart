import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:project_test_app/view_model/calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with WidgetsBindingObserver{
  late TextEditingController uidController;
  late TextEditingController upasswordController;
  late TextEditingController upasswordController2;
  late TextEditingController unameController;
  late TextEditingController uemailController;
  late TextEditingController uphoneController;
  late TextEditingController height;
  late TextEditingController weight;
  late String _passCheck;
  late AppLifecycleState _lastLifeCycleState;


  @override
  void initState() {
    super.initState();

    uidController = TextEditingController();
    upasswordController = TextEditingController();
    upasswordController2 = TextEditingController();
    unameController = TextEditingController();
    uemailController = TextEditingController();
    height = TextEditingController();
    weight = TextEditingController();
    uphoneController = TextEditingController(text: "010");
    _passCheck = "";
    WidgetsBinding.instance.addObserver(this);

  }

  //  ID PW 지우기    앱상태로 프린트찍기  => Observer
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        print("detached");
        break;
      case AppLifecycleState.resumed:
        print("resume");
        break;
      case AppLifecycleState.inactive:
        _disposeSharedPreferences();
        print("inactive");
        break;
      case AppLifecycleState.paused:
        print("paused");
        break;
    }
    _lastLifeCycleState = state;
    super.didChangeAppLifecycleState(state);
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
                  height: 500,
                  width: 400,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50,0,0,0),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: uidController,
                                    decoration: const InputDecoration(
                                      labelText: "아이디를 입력하세요",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: upasswordController,
                                    onChanged:(value) => passwordCheck(),
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: "비밀번호를 입력하세요",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: upasswordController2,
                                    onChanged: (value) => passwordCheck(),
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: "비밀번호 확인",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: unameController,
                                    onChanged: (value) {
                                      passwordCheck();
                                    },
                                    decoration: const InputDecoration(
                                      labelText: "이름을 입력하세요",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: uphoneController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      labelText: "전화번호를 입력하세요(숫자만입력)",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: TextField(
                                    controller: uemailController,
                                    decoration: const InputDecoration(
                                      labelText: "이메일을 입력하세요",
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 115,
                                      child: TextField(
                                        controller: height,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: "키(cm)",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 115,
                                      child: TextField(
                                        controller: weight,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          labelText: "몸무게(kg)",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: IconButton(
                                onPressed: () {
                                  //Get.to(const Home());
                                Get.dialog(Calendar());
                                },
                                icon: Icon(Icons.check_circle)
                                ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,80,0,0),
                              child: Text(
                                _passCheck,
                                ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      //insertAction();
                      Get.back();
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // 버튼 배경색
                      foregroundColor: Colors.white, // 버튼 글씨색
                      minimumSize: const Size(300, 35),
                      shape: RoundedRectangleBorder(
                        //  버튼 모양 깎기
                        borderRadius: BorderRadius.circular(5), // 5 파라미터
                      ),
                    ),
                    child: const Text(
                      "회원가입",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  passwordCheck() {

    upasswordController.text.trim() == upasswordController2.text.trim()
        ? _passCheck= "일치"
        : _passCheck= "불일치";
          
        setState(() {
        });
  }






  _disposeSharedPreferences() async {
    // 저장된 ID PW를 지우기
    final prefernece = await SharedPreferences.getInstance();
    prefernece.clear();
  }









}
