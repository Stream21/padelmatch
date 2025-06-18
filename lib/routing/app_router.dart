import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/login_screen_neumorphic.dart';
import '../features/onboarding/views/onboarding_screen.dart';
import '../providers/theme_provider.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, __) => LoginScreenNeumorphic(
          onToggleTheme: () {
            final container = ProviderScope.containerOf(context, listen: false);
            final mode = container.read(themeModeProvider);
            container.read(themeModeProvider.notifier).state =
                mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
          },
        ),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (_, __) => const OnboardingScreen(),
      ),
    ],
  );
});
