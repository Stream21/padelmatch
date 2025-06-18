// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get onboardingTitle => '¿Cuál es tu nivel?';

  @override
  String get onboardingSubtitle => 'Selecciona tu nivel actual de juego';

  @override
  String get next => 'Siguiente';

  @override
  String get start => 'Comenzar';

  @override
  String get back => 'Atrás';

  @override
  String get clubStepTitle => 'Selecciona hasta 3 clubes';

  @override
  String get levelStepTitle => 'Selecciona tu división y escala';

  @override
  String get personalStepTitle => 'Datos personales';

  @override
  String get divisionIniciado => 'Iniciado';

  @override
  String get divisionCuarta => 'Cuarta';

  @override
  String get divisionTercera => 'Tercera';

  @override
  String get divisionSegunda => 'Segunda';

  @override
  String get divisionPrimera => 'Primera';

  @override
  String get descIniciado => 'Empezando en el pádel';

  @override
  String get descCuarta => 'Nivel básico consolidado';

  @override
  String get descTercera => 'Nivel intermedio';

  @override
  String get descSegunda => 'Nivel avanzado';

  @override
  String get descPrimera => 'Nivel profesional';

  @override
  String get scaleBaja => 'Baja';

  @override
  String get scaleAlta => 'Alta';

  @override
  String get personalName => 'Nombre del jugador';

  @override
  String get personalAge => 'Edad';

  @override
  String get personalLocation => 'Ubicación';

  @override
  String get personalAvatar => 'Avatar';

  @override
  String get clubStepSubtitle => 'Elige los clubes donde juegas habitualmente';

  @override
  String get clubSelected => 'Club seleccionado';

  @override
  String get clubMaxSelected => 'Solo puedes seleccionar hasta 3 clubes';

  @override
  String get clubContinue => 'Continuar';

  @override
  String get clubClear => 'Limpiar selección';

  @override
  String get clubWhereDoYouPlay => '¿Dónde juegas?';

  @override
  String get clubSelectUpTo3 => 'Selecciona hasta 3 clubs que visitas frecuentemente';

  @override
  String clubSelectedCount(Object count) {
    return '$count/3 clubs seleccionados';
  }

  @override
  String get loginSlogan => 'Conecta. Juega. Compite.';

  @override
  String get loginContinueWithGoogle => 'Continuar con Google';

  @override
  String get loginContinueWithInstagram => 'Continuar con Instagram';

  @override
  String get loginOr => 'o';

  @override
  String get loginEmail => 'Correo electrónico';

  @override
  String get loginPassword => 'Contraseña';

  @override
  String get loginRegisterWithEmail => 'Registrarse con Email';

  @override
  String get loginAlreadyHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get loginSignIn => 'Inicia sesión';

  @override
  String errorGeneric(Object error) {
    return 'Error: $error';
  }
}
