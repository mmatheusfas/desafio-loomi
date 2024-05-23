import 'package:flutter/material.dart';
import 'package:loomi_test/support/components/infinite_scroll_loader.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
    required this.height,
    this.children,
    this.padding,
    this.itemCount,
    this.itemBuilder,
    this.scrollController,
    this.isLoading,
  });

  final double height;
  final List<Widget>? children;
  final EdgeInsetsGeometry? padding;
  final int? itemCount;
  final Widget? Function(BuildContext context, int index)? itemBuilder;
  final bool? isLoading;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    if (itemBuilder != null) {
      return _buildDynamicListView();
    }

    return _buildStaticListView();
  }

  Widget _buildDynamicListView() {
    return Stack(
      children: [
        SizedBox(
          height: height,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            itemBuilder: itemBuilder!,
          ),
        ),
        Visibility(
          visible: isLoading ?? false,
          child: const InfiniteScrollLoader(),
        ),
      ],
    );
  }

  Widget _buildStaticListView() {
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
