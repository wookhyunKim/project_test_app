import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_test_app/view_model/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;



  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 30));
    _animationController.repeat();



  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8,100,8,8),
              child: Lottie.asset(
                "images/doctor.json",
                controller: _animationController,
              ),
            ),
            const Login(),
          ],
        ),
      ),
    );
  }
}
