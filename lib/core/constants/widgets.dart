import 'package:doctor_house/core/extension/widget_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import 'colors.dart';

// COMMON UI COMPONENTS
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final Color? loadingIndicatorColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double fontSize;
  final TextStyle? textStyle;
  final double? width; // Added width property

  const CustomButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.color,
    this.textColor,
    this.loadingIndicatorColor,
    this.borderRadius = 8.0,
    this.padding,
    this.fontSize = 16.0,
    this.textStyle,
    this.width, // Added width parameter
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Apply width to SizedBox if it's provided
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: isLoading
            ? CupertinoActivityIndicator(color: loadingIndicatorColor ?? Colors.white)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) Icon(icon, size: 20, color: textColor),
                  if (icon != null) const SizedBox(width: 8),
                  Text(label, style: textStyle ?? TextStyle(fontSize: fontSize, color: textColor)),
                ],
              ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color disabledBorderColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Color cursorColor;
  final double borderWidth;
  final double? suffixIconSize;
  final double? prefixIconSize;
  final InputDecoration? customDecoration;
  final BoxConstraints? constraints;
  final String? Function(String?)? validator;
  final String? counterText;
  final Color? fillColor;
  final bool? filled;
  final EdgeInsets? contentPadding;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final void Function()? onTapSuffixIcon;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = primaryBlueColor,
    this.disabledBorderColor = primaryBlueColor,
    this.enabledBorderColor = primaryBlueColor,
    this.cursorColor = primaryBlueColor,
    this.borderWidth = 1.0,
    this.customDecoration,
    this.validator,
    this.prefixIconColor,
    this.prefixIconSize,
    this.suffixIconColor,
    this.suffixIconSize,
    this.constraints,
    this.counterText,
    this.fillColor,
    this.filled,
    this.contentPadding,
    this.keyboardType,
    this.onChanged,
    this.onTapSuffixIcon,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: cursorColor,
      validator: validator,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChanged,
      style: textStyle,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: customDecoration ??
          InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: prefixIconColor,
                    size: prefixIconSize,
                  )
                : null,
            suffixIcon: suffixIcon != null
                ? Icon(
                    suffixIcon,
                    color: suffixIconColor,
                    size: suffixIconSize,
                  ).onTap(onTapSuffixIcon!)
                : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focusedBorderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focusedBorderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focusedBorderColor, width: borderWidth),
              borderRadius: BorderRadius.circular(8),
            ),
            constraints: constraints,
            counterText: counterText,
            contentPadding: contentPadding,
            fillColor: fillColor,
            filled: filled,
            hintStyle: hintStyle,
          ),
    );
  }
}

class CustomToast {
  static void show({
    required BuildContext context,
    ToastificationType type = ToastificationType.success,
    ToastificationStyle style = ToastificationStyle.flat,
    Duration autoCloseDuration = const Duration(seconds: 5),
    required Widget title,
    Widget? description,
    Alignment alignment = Alignment.topRight,
    TextDirection direction = TextDirection.ltr,
    Duration animationDuration = const Duration(milliseconds: 300),
    Icon icon = const Icon(Icons.check),
    bool showIcon = true,
    Color primaryColor = Colors.green,
    Color backgroundColor = Colors.white,
    Color foregroundColor = Colors.black,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
    List<BoxShadow> boxShadow = const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    bool showProgressBar = true,
    CloseButtonShowType closeButtonShowType = CloseButtonShowType.onHover,
    bool closeOnClick = false,
    bool pauseOnHover = true,
    bool dragToClose = true,
    bool applyBlurEffect = true,
    ToastificationCallbacks callbacks = const ToastificationCallbacks(),
  }) {
    toastification.show(
      context: context,
      type: type,
      style: style,
      autoCloseDuration: autoCloseDuration,
      title: title,
      description: description,
      alignment: alignment,
      direction: direction,
      animationDuration: animationDuration,
      animationBuilder: _defaultAnimationBuilder,
      icon: icon,
      showIcon: showIcon,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      showProgressBar: showProgressBar,
      closeButtonShowType: closeButtonShowType,
      closeOnClick: closeOnClick,
      pauseOnHover: pauseOnHover,
      dragToClose: dragToClose,
      applyBlurEffect: applyBlurEffect,
      callbacks: callbacks,
    );
  }

  static Widget _defaultAnimationBuilder(
    BuildContext context,
    Animation<double> animation,
    Alignment alignment,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class CustomIconContainer extends StatelessWidget {
  final String iconPath;
  final double height;
  final double width;
  final double padding;
  final Color backgroundColor;
  final double borderRadius;

  const CustomIconContainer({
    super.key,
    required this.iconPath,
    this.height = 23.0,
    this.width = 23.0,
    this.padding = 5.0,
    this.backgroundColor = const Color(0xffededff),
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          iconPath,
          height: height,
          width: width,
        ),
      ),
    );
  }
}
