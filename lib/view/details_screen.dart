import 'package:covid_19_app/view/world_status.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int cases, deaths, recovered, active, critical, tests;
  DetailScreen(
      {required this.image,
      required this.name,
      required this.deaths,
      required this.active,
      required this.cases,
      required this.critical,
      required this.recovered,
      required this.tests});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    ResusableRow(title: 'Name', value: widget.name),
                    ResusableRow(
                        title: 'Cases', value: widget.cases.toString()),
                    ResusableRow(
                        title: 'Active', value: widget.active.toString()),
                    ResusableRow(
                        title: 'Tests', value: widget.tests.toString()),
                    ResusableRow(
                        title: 'Recovered', value: widget.recovered.toString()),
                    ResusableRow(
                        title: 'Critical', value: widget.critical.toString()),
                    ResusableRow(
                        title: 'Deaths', value: widget.deaths.toString()),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
