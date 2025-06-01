import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @onboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'What is your level?'**
  String get onboardingTitle;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your current playing level'**
  String get onboardingSubtitle;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @clubStepTitle.
  ///
  /// In en, this message translates to:
  /// **'Select up to 3 clubs'**
  String get clubStepTitle;

  /// No description provided for @levelStepTitle.
  ///
  /// In en, this message translates to:
  /// **'Select your division and scale'**
  String get levelStepTitle;

  /// No description provided for @personalStepTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal data'**
  String get personalStepTitle;

  /// No description provided for @divisionIniciado.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get divisionIniciado;

  /// No description provided for @divisionCuarta.
  ///
  /// In en, this message translates to:
  /// **'Fourth'**
  String get divisionCuarta;

  /// No description provided for @divisionTercera.
  ///
  /// In en, this message translates to:
  /// **'Third'**
  String get divisionTercera;

  /// No description provided for @divisionSegunda.
  ///
  /// In en, this message translates to:
  /// **'Second'**
  String get divisionSegunda;

  /// No description provided for @divisionPrimera.
  ///
  /// In en, this message translates to:
  /// **'First'**
  String get divisionPrimera;

  /// No description provided for @descIniciado.
  ///
  /// In en, this message translates to:
  /// **'Starting in padel'**
  String get descIniciado;

  /// No description provided for @descCuarta.
  ///
  /// In en, this message translates to:
  /// **'Basic consolidated level'**
  String get descCuarta;

  /// No description provided for @descTercera.
  ///
  /// In en, this message translates to:
  /// **'Intermediate level'**
  String get descTercera;

  /// No description provided for @descSegunda.
  ///
  /// In en, this message translates to:
  /// **'Advanced level'**
  String get descSegunda;

  /// No description provided for @descPrimera.
  ///
  /// In en, this message translates to:
  /// **'Professional level'**
  String get descPrimera;

  /// No description provided for @scaleBaja.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get scaleBaja;

  /// No description provided for @scaleAlta.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get scaleAlta;

  /// No description provided for @personalName.
  ///
  /// In en, this message translates to:
  /// **'Player name'**
  String get personalName;

  /// No description provided for @personalAge.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get personalAge;

  /// No description provided for @personalLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get personalLocation;

  /// No description provided for @personalAvatar.
  ///
  /// In en, this message translates to:
  /// **'Avatar'**
  String get personalAvatar;

  /// No description provided for @clubStepSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the clubs where you usually play'**
  String get clubStepSubtitle;

  /// No description provided for @clubSelected.
  ///
  /// In en, this message translates to:
  /// **'Club selected'**
  String get clubSelected;

  /// No description provided for @clubMaxSelected.
  ///
  /// In en, this message translates to:
  /// **'You can only select up to 3 clubs'**
  String get clubMaxSelected;

  /// No description provided for @clubContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get clubContinue;

  /// No description provided for @clubClear.
  ///
  /// In en, this message translates to:
  /// **'Clear selection'**
  String get clubClear;

  /// No description provided for @clubWhereDoYouPlay.
  ///
  /// In en, this message translates to:
  /// **'Where do you play?'**
  String get clubWhereDoYouPlay;

  /// No description provided for @clubSelectUpTo3.
  ///
  /// In en, this message translates to:
  /// **'Select up to 3 clubs you visit frequently'**
  String get clubSelectUpTo3;

  /// No description provided for @clubSelectedCount.
  ///
  /// In en, this message translates to:
  /// **'{count}/3 clubs selected'**
  String clubSelectedCount(Object count);

  /// No description provided for @loginSlogan.
  ///
  /// In en, this message translates to:
  /// **'Connect. Play. Compete.'**
  String get loginSlogan;

  /// No description provided for @loginContinueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get loginContinueWithGoogle;

  /// No description provided for @loginContinueWithInstagram.
  ///
  /// In en, this message translates to:
  /// **'Continue with Instagram'**
  String get loginContinueWithInstagram;

  /// No description provided for @loginOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get loginOr;

  /// No description provided for @loginEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginEmail;

  /// No description provided for @loginPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPassword;

  /// No description provided for @loginRegisterWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Register with Email'**
  String get loginRegisterWithEmail;

  /// No description provided for @loginAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get loginAlreadyHaveAccount;

  /// No description provided for @loginSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginSignIn;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorGeneric(Object error);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
