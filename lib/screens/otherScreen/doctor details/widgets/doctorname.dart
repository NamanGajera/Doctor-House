import 'package:flutter/material.dart';

class DocName extends StatelessWidget {
  const DocName({
    super.key,
    required this.docname,
  });

  final String docname;
  @override
  Widget build(BuildContext context) {
    return Text(
      docname,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
