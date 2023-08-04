import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_test_app/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
   bool _passwordVisible =false;
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
              ElevatedButton(
            onPressed: () {
              _visibility=!_visibility;
              setState(() {
                
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // 버튼 배경색
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
              SizedBox(
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
              SizedBox(
                width: 250,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: upasswordController,
                  obscureText: !_passwordVisible, //이것은 텍스트를 동적으로 가리게 할 것이다
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
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
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
            ],
          ),
        ),
        Visibility(
      visible: _visibility,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _visibility=!_visibility;
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
              Get.to(SignUp());
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
    ),
      ],
    );
  }
}
