// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../utils/const/colors.dart';

class PaymentAmount extends StatelessWidget {
  const PaymentAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: const Color.fromARGB(255, 255, 251, 250),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            /// amount
            Row(
              children: [
                Text(
                  'Amount',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                Text(
                  '\u{20B9} 450',
                  style: TextStyle(
                    fontSize: 16,
                    color: Ncolor.lightblacktext,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            /// SGST
            Row(
              children: [
                Text(
                  'SGST',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                Text(
                  '\u{20B9} 25',
                  style: TextStyle(
                    fontSize: 16,
                    color: Ncolor.lightblacktext,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            /// CGST
            Row(
              children: [
                Text(
                  'CGST',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                Text(
                  '\u{20B9} 25',
                  style: TextStyle(
                    fontSize: 16,
                    color: Ncolor.lightblacktext,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(thickness: 1.5),
            SizedBox(height: 20),

            /// Total Amount
            Row(
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                Text(
                  '\u{20B9} 500',
                  style: TextStyle(
                    fontSize: 16,
                    color: Ncolor.lightblacktext,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
