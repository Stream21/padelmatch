// Pantalla principal de onboarding (movida desde onboarding_screen.dart)
// ...código original de onboarding_screen.dart aquí...

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../onboarding_controller.dart';
import '../widgets/club_multi_select_step.dart';
import '../widgets/level_single_choice_step.dart';
import '../widgets/personal_data_step.dart';
import '../../../l10n/app_localizations.dart';
import 'package:padelmatch/shared/widgets/rounded_accent_button.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);
    final controller = ref.read(onboardingProvider.notifier);

    final pageController = PageController(initialPage: state.index);

    final steps = [
      const ClubMultiSelectStep(),
      const LevelSingleChoiceStep(),
      const PersonalDataStep(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Indicador de progreso
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                steps.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i <= state.index
                        ? const Color(0xFF4ABDAC)
                        : Colors.grey.shade700,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                itemCount: steps.length,
                itemBuilder: (_, i) => steps[i],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ← Atrás
                  IconButton(
                    onPressed: state.index == 0
                        ? null
                        : () {
                            controller.back();
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  // Siguiente / Comenzar
                  RoundedAccentButton(
                    text: state.index == steps.length - 1
                        ? AppLocalizations.of(context)!.start
                        : AppLocalizations.of(context)!.next,
                    icon: const Icon(Icons.arrow_forward),
                    enabled: state.canProceed,
                    onPressed: () {
                      if (state.index == steps.length - 1) {
                        // TODO: enlazar con tu lógica (Firestore, etc.)
                        debugPrint(controller.buildPayload().toString());
                      } else {
                        controller.next(steps.length);
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
