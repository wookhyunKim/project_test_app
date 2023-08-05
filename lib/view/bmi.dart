import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:lottie/lottie.dart';

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> with SingleTickerProviderStateMixin{

    late AnimationController _animationController;
    late List item;

    
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.repeat();
    item = [
      "jumping.json",
      "swim.json",
      "walking.json"
    ];



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
            const Text(
              "BMI",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                    radiusFactor: 1, // 차트크기
                    minimum: 10, // 시작값
                    maximum: 45, // 끝값
                    startAngle: 180, // 시작각도
                    endAngle: 0, // 끝각도
                    interval: 5, // 간격
                    canScaleToFit: false, // 크기맞추기
                    canRotateLabels: true, // 눈금이 각도대로맞춰지기
                    showFirstLabel: true, // 시작값보이기 시계에서 0일때 false
                    showLastLabel: true,
                    isInversed: false, // 좌우대칭
                    showLabels: true,
                    showAxisLine: false,
                    labelsPosition: ElementsPosition.outside,
                    // axisLineStyle: AxisLineStyle(
                    //   thickness: 0.1, // 축 두께
                    //   cornerStyle: CornerStyle.bothCurve,//축 끝에 둥글게하기
                    //   //color: Colors.blue,
                    //   dashArray: <double>[5,5],// 눈금분할하기
                    // ),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: 22.5,
                        enableAnimation: true,
                        animationDuration: 4000,
                        needleStartWidth: 0,
                        needleEndWidth: 10,
                      ),
                    ],
                    ranges: [
                      GaugeRange(
                        startValue: 10,
                        endValue: 18.5,
                        color: Colors.green,
                        startWidth: 0,
                        endWidth: 10,
                      ),
                      GaugeRange(
                        startValue: 18.5,
                        endValue: 25,
                        color: Colors.yellow,
                        startWidth: 10,
                        endWidth: 20,
                      ),
                      GaugeRange(
                        startValue: 25,
                        endValue: 35,
                        color: Colors.orange,
                        startWidth: 20,
                        endWidth: 30,
                      ),
                      GaugeRange(
                        startValue: 35,
                        endValue: 45,
                        color: Colors.red,
                        startWidth: 30,
                        endWidth: 40,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Text(
                            '22.5',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.5)
                    ]),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: item.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: index % 2 == 1 ? Colors.cyanAccent : Colors.lightGreenAccent,
                    child: Row(
                      children: [
                        Lottie.asset(
                          "images/${item[index]}",
                          controller: _animationController,
                          width: 100,
                          height: 100,
                        ),
                        Text("hihi"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
