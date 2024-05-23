import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loomi_test/features/sports/repository/sports_repository.dart';
import 'package:loomi_test/features/sports/sports_controller.dart';
import 'package:loomi_test/services/service_locator.dart';
import 'package:loomi_test/support/components/default_loader.dart';
import 'package:loomi_test/support/components/gradient_background.dart';
import 'package:loomi_test/support/extensions/dialog_extensions.dart';
import 'package:loomi_test/support/utils/app_assets.dart';
import 'package:loomi_ui/loomi_ui.dart';

import '../../support/components/error_alert.dart';

class SportsView extends StatefulWidget {
  const SportsView({super.key});

  @override
  State<SportsView> createState() => _SportsViewState();
}

class _SportsViewState extends State<SportsView> {
  final controller = SportsController(repository: SportsRepository(getIt.get<Dio>()));

  @override
  void initState() {
    controller.getAllSports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 12),
          child: Column(
            children: [
              Row(
                children: [
                  DefaultBackButton(
                    iconPath: AppAssets.icArrowBack,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  Text("Esportes", style: AppFonts.montserratBold(16))
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search_sharp,
                    color: AppColors.black,
                  ),
                  hintText: "Pesquisar...",
                  filled: true,
                  fillColor: AppColors.white,
                  focusColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.lightGrey),
                    borderRadius: BorderRadius.circular(48),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.lightGrey),
                    borderRadius: BorderRadius.circular(48),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.lightGrey),
                    borderRadius: BorderRadius.circular(48),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) {
                  if (!controller.isLoading && controller.errorMessage.isNotEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showCustomDialog(
                        dialog: ErrorAlert(
                          errorMessage: controller.errorMessage,
                          onPressed: () {
                            controller.changeErrorMessage('');
                            Navigator.popUntil(context, ModalRoute.withName('/home'));
                          },
                        ),
                      );
                    });
                  }

                  if (controller.isLoading && controller.sports.isEmpty) {
                    return const Expanded(child: DefaultLoader());
                  }
                  return Expanded(
                    child: GridView.builder(
                      itemCount: controller.sports.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemBuilder: (_, index) {
                        final sport = controller.sports[index];

                        return SportCard(imagePath: sport.image, sportName: sport.name);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
