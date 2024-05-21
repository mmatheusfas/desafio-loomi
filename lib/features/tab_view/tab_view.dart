import 'package:flutter/material.dart';
import 'package:loomi_test/features/home/home_view.dart';
import 'package:loomi_test/support/components/gradient_background.dart';
import 'package:loomi_test/support/utils/app_assets.dart';
import 'package:loomi_ui/loomi_ui.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.lightYellow,
            centerTitle: true,
            title: Image.asset(AppAssets.icImperioLogo),
            bottom: HomeTabBar(),
          ),
          body: const TabBarView(
            children: [
              HomeView(),
              HomeView(),
              HomeView(),
              HomeView(),
            ],
          ),
        ),
      ),
    );
  }
}
