import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavHelper on BuildContext {
  void openOnboarding() => go('/onboarding');
  void openStage() => go('/stage');
  void openLogin() => go('/');
}
