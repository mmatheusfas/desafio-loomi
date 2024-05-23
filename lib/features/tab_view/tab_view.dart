import 'package:flutter/material.dart';
import 'package:loomi_test/features/home/home_view.dart';
import 'package:loomi_test/support/components/gradient_background.dart';
import 'package:loomi_ui/loomi_ui.dart';

import '../../support/utils/app_assets.dart';

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
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.lightYellow,
            centerTitle: true,
            title: Image.asset(AppAssets.icImperioLogo),
            bottom: HomeTabBar(
              tabItems: const [
                TabBarItem(imagePath: AppAssets.icWhistle, label: "Todos"),
                TabBarItem(imagePath: AppAssets.icSoccer, label: "Futebol"),
                TabBarItem(imagePath: AppAssets.icBasketball, label: "Basquete"),
                TabBarItem(imagePath: AppAssets.icEsports, label: "E-Sports"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              HomeView(),
              Center(child: Text("Futebol")),
              Center(child: Text("Basquete")),
              Center(child: Text("E-sports")),
            ],
          ),
        ),
      ),
    );
  }
}
