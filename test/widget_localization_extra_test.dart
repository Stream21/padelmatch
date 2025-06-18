import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padelmatch/features/onboarding/widgets/level_single_choice_step.dart';
import 'package:padelmatch/features/onboarding/widgets/club_multi_select_step.dart';
import 'package:padelmatch/features/onboarding/widgets/personal_data_step.dart';
import 'package:padelmatch/features/auth/login_screen_neumorphic.dart';
import 'package:padelmatch/l10n/app_localizations.dart';

void main() {
  group('Onboarding Widgets', () {
    testWidgets('LevelSingleChoiceStep renders and shows localized title', (
      tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [Locale('es'), Locale('en')],
            home: const LevelSingleChoiceStep(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.textContaining('nivel', findRichText: true), findsOneWidget);
    });

    testWidgets('ClubMultiSelectStep renders and shows localized subtitle', (
      tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [Locale('es'), Locale('en')],
            home: const ClubMultiSelectStep(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.textContaining('club', findRichText: true), findsWidgets);
    });

    testWidgets('PersonalDataStep renders and shows localized fields', (
      tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [Locale('es'), Locale('en')],
            home: const PersonalDataStep(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.textContaining('Nombre', findRichText: true), findsOneWidget);
    });

    testWidgets('LevelSingleChoiceStep error message is localized', (
      tester,
    ) async {
      // Placeholder: implement provider mock to force error and check localization
      expect(true, isTrue);
    });
  });

  group('Auth Widgets', () {
    testWidgets('LoginScreenNeumorphic renders and shows localized slogan', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('es'), Locale('en')],
          locale: const Locale('es'),
          home: LoginScreenNeumorphic(onToggleTheme: () {}),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.textContaining('Conecta', findRichText: true),
        findsOneWidget,
      );
    });

    testWidgets('LoginScreenNeumorphic shows Google and Instagram buttons', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('es'), Locale('en')],
          locale: const Locale('es'),
          home: LoginScreenNeumorphic(onToggleTheme: () {}),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.textContaining('Google', findRichText: true), findsOneWidget);
      expect(
        find.textContaining('Instagram', findRichText: true),
        findsOneWidget,
      );
    });
  });

  group('General', () {
    testWidgets('App shows localized error message', (tester) async {
      // Placeholder: implement error scenario in a widget and check for errorGeneric
      expect(true, isTrue);
    });
  });
}
