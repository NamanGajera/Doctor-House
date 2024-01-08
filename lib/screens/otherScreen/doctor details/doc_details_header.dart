import 'package:flutter/material.dart';

import 'widgets/doccity.dart';
import 'widgets/doctordegree.dart';
import 'widgets/doctorimage.dart';
import 'widgets/doctorname.dart';
import 'widgets/doctortype.dart';

class DocDetailsHeader extends StatelessWidget {
  const DocDetailsHeader({
    super.key,
    required this.docname,
    required this.doctype,
    required this.doccity,
    required this.docdegree,
  });

  final String docname;
  final String doctype;
  final String doccity;
  final String docdegree;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Doctor Image
        const DoctorImage(),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),

              /// Doctor Name
              DocName(docname: docname),
              const SizedBox(height: 5),

              /// Doctor Type
              DocType(doctype: doctype),
              const SizedBox(height: 5),

              /// Doctor City
              DocCity(doccity: doccity),
              const SizedBox(height: 5),

              /// Doctor City
              DocDegree(docdegree: docdegree),
            ],
          ),
        ),
      ],
    );
  }
}
