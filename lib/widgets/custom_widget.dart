import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final Widget widgetChild;
  final Color color;
  CustomWidget({
    this.color,
    this.widgetChild,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color ?? const Color(0xff343b4b),
      ),
      height: 160,
      width: 177,
      child: widgetChild,
    );
  }
}
