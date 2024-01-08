import 'package:flutter/material.dart';

import '../../../../utils/const/colors.dart';

class DocDegree extends StatelessWidget {
  const DocDegree({super.key, required this.docdegree});
  final String docdegree;
  @override
  Widget build(BuildContext context) {
    return Text(
      docdegree,
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 16,
        color: Ncolor.lightblacktext,
      ),
    );
  }
}
