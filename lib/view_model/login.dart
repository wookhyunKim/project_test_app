import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_test_app/view/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  TextEditingController upasswordController = TextEditingController();
  TextEditingController uidController = TextEditingController();
  bool _visibility = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: !_visibility,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8,50,8,8),
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: uidController,
                    decoration: InputDecoration(
                      labelText: 'ID',
                      hintText: 'Enter your ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // 이것이 핵심 아이디어이다
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: upasswordController,
                    obscureText:
                        !_passwordVisible, //이것은 텍스트를 동적으로 가리게 할 것이다
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // 이것이 핵심 아이디어이다
                      suffixIcon: IconButton(
                        icon: Icon(
                          // passwordVisible 상태에 따라 아이콘을 선택한다
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // 상태를 업데이트한다. 즉, passwordVisible 변수의 상태를 토글한다.
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _visibility = !_visibility;
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // 버튼 배경색
                    foregroundColor: Colors.white, // 버튼 글씨색
                    shape: RoundedRectangleBorder(
                      //  버튼 모양 깎기
                      borderRadius: BorderRadius.circular(10), // 10은 파라미터
                    ),
                  ),
                  child: const Text(
                    "Log In",
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: _visibility,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 150, 8, 8),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(SignUp());
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // 버튼 배경색
                    foregroundColor: Colors.white, // 버튼 글씨색
                    minimumSize: Size(300, 50),
                    shape: RoundedRectangleBorder(
                      //  버튼 모양 깎기
                      borderRadius: BorderRadius.circular(30), // 10은 파라미터
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  _visibility = !_visibility;
                  setState(() {});
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  minimumSize: Size(300, 50),
                  side: BorderSide(
                    // 테두리
                    color: Colors.purple, // 테두리 색상
                    width: 2.7, // 테두리 두께
                  ),
                ),
                child: const Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
