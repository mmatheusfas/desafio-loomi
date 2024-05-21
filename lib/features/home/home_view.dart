import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_test/features/home/home_controller.dart';
import 'package:loomi_test/repositories/home/home_repository.dart';
import 'package:loomi_test/services/service_locator.dart';
import 'package:loomi_test/support/components/gradient_background.dart';
import 'package:loomi_test/support/components/horizontal_list_view.dart';
import 'package:loomi_test/support/utils/app_assets.dart';
import 'package:loomi_ui/loomi_ui.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = HomeController(repository: HomeRepository(getIt.get<Dio>()));

  @override
  void initState() {
    super.initState();
    controller.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Observer(
          builder: (_) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HorizontalListView(
                    height: 178,
                    padding: EdgeInsets.only(top: 12),
                    children: [
                      InfoCard(
                        backgroundColor: AppColors.yellow,
                        title: "Campeonatos\npopulares",
                        imagePath: AppAssets.championshipCover,
                      ),
                      InfoCard(
                        backgroundColor: AppColors.mediumGrey,
                        title: "NBA",
                        description: "National Basketball\nassociation",
                        imagePath: AppAssets.nbaCover,
                      ),
                      InfoCard(
                        positionedRight: -73,
                        positionedTop: -30,
                        backgroundColor: AppColors.lightYellow,
                        title: "League\nof its Own",
                        imagePath: AppAssets.esportsCover,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const SectionHeader(sectionName: "Campeonatos populares"),
                  const SizedBox(height: 12),
                  HorizontalListView(
                    height: 80,
                    itemCount: controller.championships.length,
                    itemBuilder: (_, index) {
                      final championship = controller.championships[index];
                      return ChampionshipCard(
                        imagePath: championship.image,
                        championshipName: championship.name,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  const HorizontalListView(
                    height: 48,
                    children: [
                      DateViewer(isSelected: true, label: "Live"),
                      DateViewer(isSelected: false, label: "Hoje"),
                      DateViewer(isSelected: false, label: "01/11"),
                      DateViewer(isSelected: false, label: "02/11"),
                      DateViewer(isSelected: false, label: "03/11"),
                    ],
                  ),
                  const SizedBox(height: 12),
                  MatchSummaryCard(
                    teamAImagePath: controller.matches.first.teamAImage,
                    teamAName: controller.matches.first.teamA,
                    teamBImagePath: controller.matches.first.teamBImage,
                    teamBName: controller.matches.first.teamB,
                    teamAScore: controller.matches.first.teamAScore,
                    teamBScore: controller.matches.first.teamBScore,
                    xBetImagePath: AppAssets.xBetLogo,
                    xBetOdd: controller.matches.first.xbet,
                    betSafeImagePath: AppAssets.betSafeLogo,
                    betSafeOdd: controller.matches.first.betsafe,
                    betssonImagePath: AppAssets.betssonLogo,
                    betssonOdd: controller.matches.first.betsson,
                  ),
                  MatchSummaryCard(
                    teamAImagePath: controller.matches[7].teamAImage,
                    teamAName: controller.matches[7].teamA,
                    teamBImagePath: controller.matches[7].teamBImage,
                    teamBName: controller.matches[7].teamB,
                    teamAScore: controller.matches[7].teamAScore,
                    teamBScore: controller.matches[7].teamBScore,
                    xBetImagePath: AppAssets.xBetLogo,
                    xBetOdd: controller.matches[7].xbet,
                    betSafeImagePath: AppAssets.betSafeLogo,
                    betSafeOdd: controller.matches[7].betsafe,
                    betssonImagePath: AppAssets.betssonLogo,
                    betssonOdd: controller.matches[7].betsson,
                  ),
                  const SizedBox(height: 12),
                  const TextButtonRow(label: "Acompanhe todas as partidas"),
                  const SizedBox(height: 32),
                  const SectionHeader(sectionName: "Dicas", suffixText: "Ver todas"),
                  const SizedBox(height: 12),
                  HorizontalListView(
                    height: 300,
                    itemCount: controller.tips.length,
                    itemBuilder: (_, index) {
                      final tip = controller.tips[index];
                      return TipCard(
                        imagePath: tip.image,
                        title: tip.title,
                        description: tip.description,
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  const SectionHeader(sectionName: "Principais bônus de aposta"),
                  const SizedBox(height: 12),
                  BonusCard(platform: controller.bonus.first.platform, discount: controller.bonus.first.discount),
                  const SizedBox(height: 8),
                  BonusCard(platform: controller.bonus[2].platform, discount: controller.bonus[2].discount),
                  const SizedBox(height: 12),
                  const TextButtonRow(label: "Veja mais bônus disponíveis"),
                  // const SectionHeader(sectionName: "Últimas apostas ganhas", iconPath: AppAssets.icFire),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
