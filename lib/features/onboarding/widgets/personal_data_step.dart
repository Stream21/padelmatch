import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../onboarding_controller.dart';
import '../../../l10n/app_localizations.dart';

class PersonalDataStep extends ConsumerWidget {
  const PersonalDataStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);
    final controller = ref.read(onboardingProvider.notifier);

    final surface = Theme.of(context).colorScheme.surface;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          Text(
            AppLocalizations.of(context)!.personalStepTitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          _PersonalField(
            label: AppLocalizations.of(context)!.personalName,
            initialValue: state.personal.name,
            onChanged: (value) =>
                controller.setPersonal(state.personal.copyWith(name: value)),
            surface: surface,
          ),
          _PersonalField(
            label: AppLocalizations.of(context)!.personalAge,
            initialValue: state.personal.age,
            onChanged: (value) =>
                controller.setPersonal(state.personal.copyWith(age: value)),
            surface: surface,
            keyboardType: TextInputType.number,
          ),
          _PersonalField(
            label: AppLocalizations.of(context)!.personalLocation,
            initialValue: state.personal.location,
            onChanged: (value) => controller.setPersonal(
              state.personal.copyWith(location: value),
            ),
            surface: surface,
          ),
        ],
      ),
    );
  }
}

class _PersonalField extends StatefulWidget {
  final String label;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final Color surface;

  const _PersonalField({
    required this.label,
    required this.initialValue,
    required this.onChanged,
    required this.surface,
    this.keyboardType,
  });

  @override
  State<_PersonalField> createState() => _PersonalFieldState();
}

class _PersonalFieldState extends State<_PersonalField> {
  late TextEditingController _controller;
  bool _pressed = false;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant _PersonalField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Solo actualiza el texto si el campo NO tiene el foco (no está escribiendo)
    if (!_focused && oldWidget.initialValue != widget.initialValue) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selected = _focused || _controller.text.isNotEmpty;

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            color: widget.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: _focused
                  ? const Color(0xFF20E3B2)
                  : (Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade600
                        : Colors.grey.shade300),
              width: 2,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: const Color(0xFF20E3B2).withOpacity(0.45),
                      blurRadius: 14,
                      spreadRadius: 1,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(4, 4),
                    ),
                  ],
          ),
          child: Focus(
            onFocusChange: (hasFocus) => setState(() => _focused = hasFocus),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: widget.label,
                border: InputBorder.none,
              ),
              keyboardType: widget.keyboardType,
              onChanged: (value) {
                // Solo llama a onChanged si el valor realmente cambia
                if (value != widget.initialValue) {
                  widget.onChanged(value);
                }
              },
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
