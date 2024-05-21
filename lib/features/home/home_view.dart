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
                  Text("Campeonatos populares", style: AppFonts.montserratBold(18)),
                  const SizedBox(height: 12),
                  const HorizontalListView(
                    height: 80,
                    children: [
                      ChampionshipCard(imagePath: AppAssets.icChampionsLeague),
                      ChampionshipCard(imagePath: AppAssets.icEuroLeague),
                      ChampionshipCard(imagePath: AppAssets.icSerieA),
                      ChampionshipCard(imagePath: AppAssets.icLaLiga),
                      ChampionshipCard(imagePath: AppAssets.icLaLiga),
                    ],
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
                    xBetImagePath: AppAssets.xBetLogo,
                    xBetOdd: controller.matches.first.xbet,
                    betSafeImagePath: AppAssets.betSafeLogo,
                    betSafeOdd: controller.matches.first.betsafe,
                    betssonImagePath: AppAssets.betssonLogo,
                    betssonOdd: controller.matches.first.betsson,
                  ),
                  MatchSummaryCard(
                    teamAImagePath: controller.matches.first.teamAImage,
                    teamAName: controller.matches.first.teamA,
                    teamBImagePath: controller.matches.first.teamBImage,
                    teamBName: controller.matches.first.teamB,
                    xBetImagePath: AppAssets.xBetLogo,
                    xBetOdd: controller.matches.first.xbet,
                    betSafeImagePath: AppAssets.betSafeLogo,
                    betSafeOdd: controller.matches.first.betsafe,
                    betssonImagePath: AppAssets.betssonLogo,
                    betssonOdd: controller.matches.first.betsson,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Acompanhe todas as partidas",
                        style: AppFonts.montserratBold(14, AppColors.darkGrey),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(64, 46),
                          maximumSize: const Size(64, 46),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
