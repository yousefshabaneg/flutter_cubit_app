import 'package:flutter/material.dart';
import 'package:flutter_cubit_appp/misc/colors.dart';
import 'package:flutter_cubit_appp/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  double size;
  bool isIcon;
  IconData? icon;
  String? text;
  AppButton({
    Key? key,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    this.text = "Hi",
    this.isIcon = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: isIcon
          ? Center(child: Icon(icon, color: color))
          : Center(child: AppText(text: text!, color: color)),
    );
  }
}
