import 'package:flutter/material.dart';

class SelectableTile extends StatefulWidget {
  const SelectableTile({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    required this.position,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final int position;

  @override
  State<SelectableTile> createState() => _SelectableTileState();
}

class _SelectableTileState extends State<SelectableTile> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dark = theme.brightness == Brightness.dark;
    final surface = theme.colorScheme.surface;
    final borderColor = widget.selected
        ? const Color(0xFF20E3B2)
        : (dark ? Colors.grey.shade600 : Colors.grey.shade300);
    final textColor = widget.selected
        ? Colors.white
        : (dark ? Colors.white : Colors.black87);

    final gradient = LinearGradient(
      colors: widget.selected
          ? [const Color(0xFF20E3B2), const Color(0xFF2CCCFF)]
          : [surface, surface],
    );

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: widget.selected
                ? [
                    BoxShadow(
                      color: const Color(0xFF20E3B2).withOpacity(0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
            border: Border.all(color: borderColor, width: 2),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
