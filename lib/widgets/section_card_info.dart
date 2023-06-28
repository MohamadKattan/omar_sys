import 'package:flutter/material.dart';

class SectionCardInfo extends StatefulWidget {
  const SectionCardInfo({
    Key? key,
    required this.followNumber,
    required this.labelText,
  }) : super(key: key);

  final String followNumber;
  final String labelText;

  @override
  State<SectionCardInfo> createState() => _SectionCardInfoState();
}

class _SectionCardInfoState extends State<SectionCardInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Column(
        children: [
          Text(
            widget.followNumber.toString(),
            style: const TextStyle(
              fontSize: 16,
            ),
            // style: kSectionNumbersStyle,
          ),
          const SizedBox(height: 10,),
          Text(
            widget.labelText,
            style: const TextStyle(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
