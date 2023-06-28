import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class FromHtmlWidget extends StatelessWidget {
  final String htmlCode;
  const FromHtmlWidget({Key? key, required this.htmlCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(htmlCode) ;
  }
}
