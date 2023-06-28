import 'package:flutter/material.dart';
import 'filter_info.dart';

class BuildSheet extends StatefulWidget {
  const BuildSheet({Key? key}) : super(key: key);

  @override
  State<BuildSheet> createState() => _BuildSheetState();
}
List<String> location = ['One', 'Two', 'Three', 'Four'];
List<String> state = ['Five', 'Six', 'Seven', 'Eight'];
class _BuildSheetState extends State<BuildSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FilterInfo(
              filterName: 'By Country',
              filterHint: 'Select a Vehicle',
              location: location,
            ),
            FilterInfo(
              filterName: 'By State',
              filterHint: 'Select a Vehicle',
              location: state,
            ),
          ],
        ),
      ],
    );
  }
}
