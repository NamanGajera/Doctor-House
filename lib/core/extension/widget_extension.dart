import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  // Add padding to a widget
  Widget withPadding([EdgeInsets padding = const EdgeInsets.all(8.0)]) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  // Add alignment to a widget
  Widget withAlignment(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  // Wrap a widget in a Center
  Widget centered() {
    return Center(
      child: this,
    );
  }

  // Wrap a widget in a GestureDetector
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}