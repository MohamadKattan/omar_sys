import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CardInfo extends StatefulWidget {
  const CardInfo(
      {super.key,
      required this.cardTitle,
      required this.percent,
      required this.performance,
      required this.color,
      required this.performanceStatus,
      required this.remainingCalls,
      required this.newCalls});
  final String cardTitle;
  final int percent;
  final String performance;
  final String performanceStatus;
  final String remainingCalls;
  final String newCalls;
  final Color color;

  @override
  State<CardInfo> createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  @override
  Widget build(BuildContext context) {
    // int? perc;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.cardTitle),
        ),
        CircularPercentIndicator(
          radius: 45.0,
          lineWidth: 10.0,
          percent: widget.percent / 100,
          center: Text("${widget.percent}%"),
          progressColor: widget.color,
          backgroundColor: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.performance,
                style: const TextStyle(
                  fontSize: 12
                ),
              ),
              Text(
                widget.performanceStatus,
                style: const TextStyle(
                    fontSize: 13
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20,top: 1,bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'New Calls',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    widget.newCalls,
                    // style: cardPerformanceTextStyle,
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Remaining Calls',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    widget.remainingCalls,
                    // style: cardPerformanceTextStyle,
                  ),
                ],
              ),

            ],
          ),
        )
      ],
    );
  }
}
