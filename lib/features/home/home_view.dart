import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_test/features/home/home_controller.dart';
import 'package:loomi_test/features/home/repository/home_repository.dart';
import 'package:loomi_test/services/service_locator.dart';
import 'package:loomi_test/support/components/gradient_background.dart';
import 'package:loomi_test/support/components/horizontal_list_view.dart';
import 'package:loomi_ui/loomi_ui.dart';

import '../../support/components/error_alert.dart';
import '../../support/utils/app_assets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = HomeController(repository: HomeRepository(getIt.get<Dio>()));
  late final ScrollController _championshipController;
  late final ScrollController _tipController;
  late final ScrollController _wonBetsController;

  @override
  void initState() {
    super.initState();
    controller.loadData();

    _championshipController = _createScrollController(controller.getMoreChampionships);
    _tipController = _createScrollController(controller.getMoreTips);
    _wonBetsController = _createScrollController(controller.getMoreWonBets);
  }

  @override
  void dispose() {
    super.dispose();
    _championshipController.dispose();
    _tipController.dispose();
    _wonBetsController.dispose();
  }

  ScrollController _createScrollController(VoidCallback onReachEnd) {
    final ScrollController controller = ScrollController();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent && !this.controller.isLoading) {
        onReachEnd();
      }
    });
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Observer(
          builder: (_) {
            if (!controller.isLoading && controller.errorMessage.isNotEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _dialogBuilder(context, controller);
              });
            }

            if (!controller.isLoading && controller.championships.isNotEmpty) {
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
                      scrollController: _championshipController,
                      isLoading: controller.isLoading,
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
                      scrollController: _tipController,
                      isLoading: controller.isLoading,
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
                    const SizedBox(height: 32),
                    const SectionHeader(sectionName: "Últimas apostas ganhas", iconPath: AppAssets.icFire),
                    const SizedBox(height: 12),
                    HorizontalListView(
                      height: 96,
                      itemCount: controller.wonBets.length,
                      scrollController: _wonBetsController,
                      isLoading: controller.isLoading,
                      itemBuilder: (_, index) {
                        final wonBet = controller.wonBets[index];

                        return WonBetCard(
                          userAvatarPath: wonBet.userAvatar,
                          userName: wonBet.user,
                          platform: wonBet.platform,
                          score: wonBet.score,
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void _dialogBuilder(BuildContext context, HomeController controller) {
    showDialog(
      context: context,
      builder: (_) {
        return ErrorAlert(
          errorMessage: controller.errorMessage,
          onPressed: () {
            controller.changeErrorMessage('');
            controller.loadData();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
