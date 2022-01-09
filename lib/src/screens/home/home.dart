import 'package:boozin_fitness/src/controller/helth_repository.dart';
import 'package:boozin_fitness/src/utils/font_style.dart';
import 'package:boozin_fitness/src/utils/image_path.dart';
import 'package:boozin_fitness/src/utils/loading_shimmer.dart';
import 'package:boozin_fitness/src/utils/strings.dart';
import 'package:boozin_fitness/src/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

class Home extends GetView<HelthRepository> {
  const Home({Key? key}) : super(key: key);

  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 10),
        child: Obx(() {
          final _healthPoint = controller.healthPoint;
          HealthDataPoint? steps;
          HealthDataPoint? calories;
          if (_healthPoint.isNotEmpty) {
            steps = _healthPoint.first;
            calories = _healthPoint.last;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppText.hi,
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: AppFont.nunito,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 40),
              LoadingShimmer(
                loading: steps == null,
                child: HomeCard(
                  iconPath: ImagePathLight.iconFootSteps,
                  title: '${AppText.steps}: ${steps?.value}',
                  goal: '15,000',
                ),
              ),
              LoadingShimmer(
                loading: calories == null,
                child: HomeCard(
                  iconPath: ImagePathLight.iconKcal,
                  title: '${AppText.caloriesBurned}: ${calories?.value}',
                  goal: '15,000',
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
