import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double progress = 0.0;
  @override
  void initState() {
    count();
  }

  void count() async {
    for (int progresss = 0; progresss < 101; progresss++) {
      await Future.delayed(const Duration(milliseconds: 50), () {});
      setState(() {
        progress = progresss / 100;
      });
      print(progress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Image.asset("images/intro.png", fit: BoxFit.cover),
          SizedBox(
            height: 35.0,
          ),
          Center(
            child: Text("Welcome",
                style: TextStyle(
                    fontSize: 23.0,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "Get AC Repair, Home Application Repair, Painter, Labour, Driver, Plumber, Electrician and other home services. All home related services can be available easily through one call.",
                  style: TextStyle(
                      fontSize: 13.0,
                      decoration: TextDecoration.none,
                      color: Colors.black)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
            child: LinearPercentIndicator(
              width: 392.0,
              lineHeight: 14.0,
              percent: progress,
              backgroundColor: Colors.grey,
              progressColor: Colors.yellow,
              barRadius: Radius.circular(10.0),
            ),
          ),
        ]),
      ),
    );
  }
}
