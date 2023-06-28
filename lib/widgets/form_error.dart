import 'package:flutter/material.dart';

import '../size_config.dart';


class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length,
              (index) => formErrorText(error: errors[index], context: context)),
    );
  }

  Row formErrorText({required String error, context}) {
    return Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
        SizedBox(
          width: screenWidthDivided(25, context),
          height: screenWidthDivided(15, context),
        ),
        Expanded(
          child: Text(
            error,
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
