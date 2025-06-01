import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../onboarding_controller.dart';
import '../../../l10n/app_localizations.dart';
import '../providers/onboarding_provider.dart';
import 'package:padelmatch/shared/widgets/selectable_tile.dart';

class ClubMultiSelectStep extends ConsumerWidget {
  const ClubMultiSelectStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);
    final controller = ref.read(onboardingProvider.notifier);
    final stepsAsync = ref.watch(onboardingStepsProvider);

    return stepsAsync.when(
      data: (steps) {
        final step = steps.firstWhere((s) => s.id == 'clubs');
        final clubs = step.options ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)!.clubWhereDoYouPlay,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 4),
              Text(
                AppLocalizations.of(context)!.clubSelectUpTo3,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: clubs.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (_, i) {
                    final club = clubs[i];
                    final selected = state.clubs.contains(club);
                    return SelectableTile(
                      label: club,
                      selected: selected,
                      position: selected ? state.clubs.indexOf(club) + 1 : 0,
                      onTap: () => controller.toggleClub(club),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalizations.of(
                  context,
                )!.clubSelectedCount(state.clubs.length),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
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
