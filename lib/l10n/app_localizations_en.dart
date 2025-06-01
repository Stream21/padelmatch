// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get onboardingTitle => 'What is your level?';

  @override
  String get onboardingSubtitle => 'Select your current playing level';

  @override
  String get next => 'Next';

  @override
  String get start => 'Start';

  @override
  String get back => 'Back';

  @override
  String get clubStepTitle => 'Select up to 3 clubs';

  @override
  String get levelStepTitle => 'Select your division and scale';

  @override
  String get personalStepTitle => 'Personal data';

  @override
  String get divisionIniciado => 'Beginner';

  @override
  String get divisionCuarta => 'Fourth';

  @override
  String get divisionTercera => 'Third';

  @override
  String get divisionSegunda => 'Second';

  @override
  String get divisionPrimera => 'First';

  @override
  String get descIniciado => 'Starting in padel';

  @override
  String get descCuarta => 'Basic consolidated level';

  @override
  String get descTercera => 'Intermediate level';

  @override
  String get descSegunda => 'Advanced level';

  @override
  String get descPrimera => 'Professional level';

  @override
  String get scaleBaja => 'Low';

  @override
  String get scaleAlta => 'High';

  @override
  String get personalName => 'Player name';

  @override
  String get personalAge => 'Age';

  @override
  String get personalLocation => 'Location';

  @override
  String get personalAvatar => 'Avatar';

  @override
  String get clubStepSubtitle => 'Choose the clubs where you usually play';

  @override
  String get clubSelected => 'Club selected';

  @override
  String get clubMaxSelected => 'You can only select up to 3 clubs';

  @override
  String get clubContinue => 'Continue';

  @override
  String get clubClear => 'Clear selection';

  @override
  String get clubWhereDoYouPlay => 'Where do you play?';

  @override
  String get clubSelectUpTo3 => 'Select up to 3 clubs you visit frequently';

  @override
  String clubSelectedCount(Object count) {
    return '$count/3 clubs selected';
  }

  @override
  String get loginSlogan => 'Connect. Play. Compete.';

  @override
  String get loginContinueWithGoogle => 'Continue with Google';

  @override
  String get loginContinueWithInstagram => 'Continue with Instagram';

  @override
  String get loginOr => 'or';

  @override
  String get loginEmail => 'Email';

  @override
  String get loginPassword => 'Password';

  @override
  String get loginRegisterWithEmail => 'Register with Email';

  @override
  String get loginAlreadyHaveAccount => 'Already have an account?';

  @override
  String get loginSignIn => 'Sign in';

  @override
  String errorGeneric(Object error) {
    return 'Error: $error';
  }
}
