import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/onboarding_step.dart';
import '../data/onboarding_service.dart';

final onboardingServiceProvider = Provider((ref) => OnboardingService());

final onboardingStepsProvider = FutureProvider<List<OnboardingStep>>((
  ref,
) async {
  final service = ref.read(onboardingServiceProvider);
  return service.fetchSteps();
});
