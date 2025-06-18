import '../models/onboarding_step.dart';

class OnboardingService {
  Future<List<OnboardingStep>> fetchSteps() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      OnboardingStep(
        id: 'clubs',
        title: 'Selecciona hasta 3 clubes',
        options: [
          'Club Spin Padel',
          'Club Padel Goro',
          'Club Padel Indoor Jinamar',
          'Club de padel la galera',
          'Club de padel Open Gran Canaria',
          'Clun de padel vida',
        ],
      ),
      OnboardingStep(
        id: 'level',
        title: 'Selecciona tu división',
        options: ['Iniciado', 'Cuarta', 'Tercera', 'Segunda', 'Primera'],
      ),
      OnboardingStep(
        id: 'personal',
        title: 'Datos personales',
        options:
            null, // Puedes añadir campos dinámicos si tu backend lo soporta
      ),
    ];
  }
}
