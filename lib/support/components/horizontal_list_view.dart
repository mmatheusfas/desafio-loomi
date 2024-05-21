import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
    required this.height,
    required this.children,
    this.padding,
  });

  final double height;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView(
        padding: padding,
        scrollDirection: Axis.horizontal,
        children: children,
      ),
    );
  }
}
