import 'package:flutter/material.dart';

class RoundedAccentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool enabled;
  final Widget? icon;

  const RoundedAccentButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.enabled = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary
            ? (enabled ? const Color(0xFF4ABDAC) : Colors.grey)
            : Colors.white,
        foregroundColor: isPrimary ? Colors.white : const Color(0xFF4ABDAC),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        elevation: 4,
        side: isPrimary
            ? BorderSide.none
            : const BorderSide(color: Color(0xFF4ABDAC), width: 2),
      ),
      onPressed: enabled ? onPressed : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          if (icon != null) ...[const SizedBox(width: 4), icon!],
        ],
      ),
    );
  }
}
