import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../onboarding_controller.dart';
import '../../../l10n/app_localizations.dart';
import '../providers/onboarding_provider.dart';

/// Widget que representa la selección de nivel en el onboarding.
///
/// Usa localización para todos los textos y es completamente escalable.
///
/// - Muestra divisiones y escalas traducidas.
/// - Gestiona el estado con Riverpod.
/// - Muestra errores localizados.
class LevelSingleChoiceStep extends ConsumerStatefulWidget {
  const LevelSingleChoiceStep({super.key});

  @override
  ConsumerState<LevelSingleChoiceStep> createState() =>
      _LevelSingleChoiceStepState();
}

class _LevelSingleChoiceStepState extends ConsumerState<LevelSingleChoiceStep> {
  String? expandedDivision;
  String? _pressedDivision;
  String? _pressedScale;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingProvider);
    final controller = ref.read(onboardingProvider.notifier);
    final stepsAsync = ref.watch(onboardingStepsProvider);

    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final surface = theme.colorScheme.surface;
    final borderColor = (bool selected) => selected
        ? const Color(0xFF20E3B2)
        : (dark ? Colors.grey.shade600 : Colors.grey.shade300);

    return stepsAsync.when(
      data: (steps) {
        final step = steps.firstWhere((s) => s.id == 'level');
        final divisions = step.options ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)!.onboardingTitle,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: dark ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                AppLocalizations.of(context)!.onboardingSubtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: dark ? Colors.white70 : Colors.black54,
                ),
              ),
              const SizedBox(height: 24),
              ...divisions.map((division) {
                final isExpandable = [
                  AppLocalizations.of(context)!.divisionCuarta,
                  AppLocalizations.of(context)!.divisionTercera,
                  AppLocalizations.of(context)!.divisionSegunda,
                  AppLocalizations.of(context)!.divisionPrimera,
                ].contains(division);
                final isExpanded = expandedDivision == division;
                final selected = state.level.startsWith(division);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTapDown: (_) =>
                          setState(() => _pressedDivision = division),
                      onTapUp: (_) => setState(() => _pressedDivision = null),
                      onTapCancel: () =>
                          setState(() => _pressedDivision = null),
                      onTap: () {
                        if (isExpandable) {
                          setState(() => expandedDivision = division);
                        } else {
                          controller.selectLevel(division);
                          setState(() => expandedDivision = null);
                        }
                      },
                      child: AnimatedScale(
                        scale: _pressedDivision == division ? 0.97 : 1.0,
                        duration: const Duration(milliseconds: 100),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: surface,
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: borderColor(selected),
                              width: 2,
                            ),
                            boxShadow: selected
                                ? [
                                    BoxShadow(
                                      color: const Color(
                                        0xFF20E3B2,
                                      ).withOpacity(0.45),
                                      blurRadius: 14,
                                      spreadRadius: 1,
                                    ),
                                  ]
                                : [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 8,
                                      offset: const Offset(4, 4),
                                    ),
                                  ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  division,
                                  style: TextStyle(
                                    color: selected
                                        ? (dark ? Colors.white : Colors.black87)
                                        : (dark ? Colors.white70 : Colors.black54),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              if (selected && !isExpandable)
                                const Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF4ABDAC),
                                ),
                              if (isExpandable)
                                Icon(
                                  isExpanded
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                  color: Colors.grey,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (isExpanded && isExpandable)
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Row(
                          children: [
                            ...['Baja', 'Alta'].map((scale) {
                              final localizedScale = scale == 'Baja'
                                  ? AppLocalizations.of(context)!.scaleBaja
                                  : AppLocalizations.of(context)!.scaleAlta;
                              final value = '$division $localizedScale';
                              final selectedScale = state.level == value;
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  child: GestureDetector(
                                    onTapDown: (_) =>
                                        setState(() => _pressedScale = value),
                                    onTapUp: (_) =>
                                        setState(() => _pressedScale = null),
                                    onTapCancel: () =>
                                        setState(() => _pressedScale = null),
                                    onTap: () {
                                      controller.selectLevel(value);
                                      setState(() {});
                                    },
                                    child: AnimatedScale(
                                      scale: _pressedScale == value
                                          ? 0.97
                                          : 1.0,
                                      duration: const Duration(
                                        milliseconds: 100,
                                      ),
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 250,
                                        ),
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          color: surface,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: borderColor(selectedScale),
                                            width: 2,
                                          ),
                                          boxShadow: selectedScale
                                              ? [
                                                  BoxShadow(
                                                    color: const Color(
                                                      0xFF20E3B2,
                                                    ).withOpacity(0.45),
                                                    blurRadius: 14,
                                                    spreadRadius: 1,
                                                  ),
                                                ]
                                              : [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.25),
                                                    blurRadius: 8,
                                                    offset: const Offset(4, 4),
                                                  ),
                                                ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              localizedScale,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: selectedScale
                                                    ? (dark
                                                          ? Colors.white
                                                          : Colors.black87)
                                                    : (dark
                                                          ? Colors.white
                                                                .withOpacity(
                                                                  0.9,
                                                                )
                                                          : Colors.black87
                                                                .withOpacity(
                                                                  0.7,
                                                                )),
                                              ),
                                            ),
                                            if (selectedScale)
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                  left: 8.0,
                                                ),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Color(0xFF4ABDAC),
                                                  size: 20,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                  ],
                );
              }),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) =>
          Center(child: Text(AppLocalizations.of(context)!.errorGeneric(e))),
    );
  }
}
