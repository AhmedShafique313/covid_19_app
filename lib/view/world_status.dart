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

  // ignore: non_constant_identifier_names
  final ColorList = <Color>[Colors.green, Colors.blue, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
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
                    animationDuration: const Duration(milliseconds: 1200),
                    chartType: ChartType.ring,
                    chartRadius: 150,
                    dataMap: const {"Total": 70, "Active": 21, "Deaths": 9},
                    colorList: ColorList,
                    legendOptions: const LegendOptions(
                        legendPosition: LegendPosition.left),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 600),
              child: Card(
                child: Column(
                  children: [
                    ResusableRow(title: "Title", value: "300"),
                    ResusableRow(title: "Title", value: "300"),
                    ResusableRow(title: "Title", value: "300"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              // ignore: sort_child_properties_last
              child: const Center(
                  child: Text(
                'Track Countries',
                style: TextStyle(fontSize: 16),
              )),
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
      )),
    );
  }
}

class ResusableRow extends StatelessWidget {
  String title, value;
  ResusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title),
                Text(value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
