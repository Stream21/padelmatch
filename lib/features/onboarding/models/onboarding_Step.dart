class OnboardingStep {
  final String id;
  final String title;
  final String? subtitle;
  final List<String>? options;

  OnboardingStep({
    required this.id,
    required this.title,
    this.subtitle,
    this.options,
  });
}
