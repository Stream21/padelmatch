import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'onboarding_controller.dart';
import 'widgets/club_multi_select_step.dart';
import 'widgets/level_single_choice_step.dart';
import 'widgets/personal_data_step.dart';
import '../../l10n/app_localizations.dart';

// Este archivo fue movido a views/onboarding_screen.dart

class RoundedAccentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool enabled;
  final Widget? icon;

  const RoundedAccentButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.enabled = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary
            ? (enabled ? const Color(0xFF4ABDAC) : Colors.grey)
            : Colors.white,
        foregroundColor: isPrimary ? Colors.white : const Color(0xFF4ABDAC),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        elevation: 4,
        side: isPrimary
            ? BorderSide.none
            : const BorderSide(color: Color(0xFF4ABDAC), width: 2),
      ),
      onPressed: enabled ? onPressed : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          if (icon != null) ...[const SizedBox(width: 4), icon!],
        ],
      ),
    );
  }
}

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
