import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
    required this.height,
    this.children,
    this.padding,
    this.itemCount,
    this.itemBuilder,
  });

  final double height;
  final List<Widget>? children;
  final EdgeInsetsGeometry? padding;
  final int? itemCount;
  final Widget? Function(BuildContext context, int index)? itemBuilder;

  @override
  Widget build(BuildContext context) {
    if (itemBuilder != null) {
      return SizedBox(
        height: height,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: itemBuilder!,
        ),
      );
    }

    return SizedBox(
      height: height,
      child: ListView(
        padding: padding,
        scrollDirection: Axis.horizontal,
        children: children ?? [],
      ),
    );
  }
}
