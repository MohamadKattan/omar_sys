import 'package:flutter/material.dart';

import 'main_card.dart';

class CallRecordFollows extends StatefulWidget {
  const CallRecordFollows(
      {super.key, required this.customerComment, required this.followNumber});
  final String customerComment;
  final int followNumber;
  @override
  State<CallRecordFollows> createState() => _CallRecordFollowsState();
}

class _CallRecordFollowsState extends State<CallRecordFollows> {
  @override
  Widget build(BuildContext context) {
    return MainCard(
      color: const Color(0xFFD9D9D9),
      cardChild: Column(
        children: [
          MainCard(
            color: Colors.white,
            cardChild: Container(
              padding: const EdgeInsets.all(8),
              width: 100,
              child: Text(widget.customerComment),
            ),
          ),
          MainCard(
            color: Colors.white,
            cardChild: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Text(widget.followNumber.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
