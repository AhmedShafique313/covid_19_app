import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatusScreen extends StatefulWidget {
  const WorldStatusScreen({super.key});

  @override
  State<WorldStatusScreen> createState() => _WorldStatusScreenState();
}

class _WorldStatusScreenState extends State<WorldStatusScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final ColorList = <Color>[Colors.green, Colors.blue, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                  height: 200,
                  width: 300,
                  child: PieChart(
                    chartType: ChartType.ring,
                    chartRadius: 150,
                    dataMap: const {"Total": 70, "Active": 21, "Deaths": 9},
                    colorList: ColorList,
                  )),
            )
          ],
        ),
      )),
    );
  }
}
