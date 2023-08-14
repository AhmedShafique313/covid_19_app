import 'package:covid_19_app/Models/StatusApi.dart';
import 'package:covid_19_app/Services/utilities/statuses_services.dart';
import 'package:covid_19_app/view/countires_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:covid_19_app/Models/StatusApi.dart';
import 'package:covid_19_app/Services/utilities/APIs_URL.dart';
import 'package:http/http.dart' as http;

class WorldStatusScreen extends StatefulWidget {
  const WorldStatusScreen({Key? key}) : super(key: key);

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
    StatusServices statusServices = StatusServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: statusServices.getWorldStatusApi(),
                builder: (context, AsyncSnapshot<StatusApiScreen> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        size: 50,
                        controller: _controller,
                      ),
                    );
                  } else {
                    return Center(
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 300,
                            child: PieChart(
                              animationDuration:
                                  const Duration(milliseconds: 1200),
                              chartType: ChartType.ring,
                              chartRadius: 150,
                              dataMap: {
                                "Cases": double.parse(
                                    snapshot.data!.cases!.toString()),
                                "Recovered": double.parse(
                                    snapshot.data!.recovered.toString()),
                                "Deaths": double.parse(
                                    snapshot.data!.deaths.toString()),
                              },
                              colorList: ColorList,
                              legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Card(
                              child: Column(
                                children: [
                                  ResusableRow(
                                      title: "Cases",
                                      value: snapshot.data!.cases.toString()),
                                  ResusableRow(
                                      title: "Recovered",
                                      value:
                                          snapshot.data!.recovered.toString()),
                                  ResusableRow(
                                      title: "Critical",
                                      value:
                                          snapshot.data!.critical.toString()),
                                  ResusableRow(
                                      title: "Deaths",
                                      value: snapshot.data!.deaths.toString()),
                                  ResusableRow(
                                      title: "Active",
                                      value: snapshot.data!.active.toString()),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CountriesList()));
                            },
                            child: Container(
                              child: const Center(
                                child: Text(
                                  'Track Countries',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// getWorldStatusApi() {}

class ResusableRow extends StatelessWidget {
  final String title;
  final String value;

  ResusableRow({required this.title, required this.value});

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
