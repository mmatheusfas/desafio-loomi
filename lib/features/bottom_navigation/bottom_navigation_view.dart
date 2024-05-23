import 'package:flutter/material.dart';
import 'package:loomi_test/features/tab_view/tab_view.dart';
import 'package:loomi_test/support/constants.dart';
import 'package:loomi_ui/loomi_ui.dart';

import '../../support/utils/app_assets.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DefaultSideMenu(
        topSectionIconPath: AppAssets.icQuestionCircle,
        topSectionLabel: "Ajuda e suporte",
        middleSectionMenuItems: [
          SideMenuItem(iconPath: AppAssets.icHome, label: "Início", onTapItem: () {}),
          SideMenuItem(iconPath: AppAssets.icWhistle, label: "Esportes", onTapItem: () {}),
          SideMenuItem(iconPath: AppAssets.icBookmark, label: "Notícias e Dicas", onTapItem: () {}),
          SideMenuItem(iconPath: AppAssets.icStar, label: "Favoritos", onTapItem: () {}),
          SideMenuItem(iconPath: AppAssets.icThreeUser, label: "Influenciadores", onTapItem: () {}),
          SideMenuItem(iconPath: AppAssets.icPie, label: "Comparador de odds", onTapItem: () {}),
        ],
        bottomSectionMenuItems: [
          SideMenuItem(iconPath: AppAssets.icCoupon, label: "Jogo consciente", onTapItem: () {}),
          SideMenuItem(iconPath: AppAssets.icShield, label: "Privacidade e segurança", onTapItem: () {}),
        ],
      ),
      body: const IndexedStack(
        children: [
          TabView(),
        ],
      ),
      bottomNavigationBar: Builder(
        builder: (context) {
          return DefaultBottomNavigation(
            appLogoPath: AppAssets.icImperioLogo,
            firstBottomIconPath: AppAssets.icHomeFilled,
            secondBottomIconPath: AppAssets.icWhistle,
            thirdBottomIconPath: AppAssets.icBookmark,
            userAvatarPath: Constants.loomiLogo,
            onTapMenu: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    );
  }
}
