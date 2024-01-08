import 'package:flutter/material.dart';

import '../../../../utils/const/colors.dart';

class DocType extends StatelessWidget {
  const DocType({
    super.key,
    required this.doctype,
  });
  final String doctype;
  @override
  Widget build(BuildContext context) {
    return Text(
      doctype,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 18,
        color: Ncolor.lightblacktext,
      ),
    );
  }
}
