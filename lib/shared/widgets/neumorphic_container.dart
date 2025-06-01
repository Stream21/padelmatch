import 'package:flutter/material.dart';

/// Modo de relieve
enum NeuShape { concave, convex, flat }

class NeumorphicContainer extends StatelessWidget {
  const NeumorphicContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 20,
    this.depth = 4, // + → sobresale; – → hundido
    this.color, // si null usa Theme.surfaceColor
    this.shape = NeuShape.concave,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double depth;
  final Color? color;
  final NeuShape shape;

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final baseColor = color ?? Theme.of(context).colorScheme.surface;

    // Sombra clara arriba-izq · oscura abajo-dcha
    final blur = (depth.abs() * 4).clamp(4, 40).toDouble();
    final spread = depth.sign * 1.0;

    final lightShadow = BoxShadow(
      color: brightness == Brightness.dark
          ? Colors.white.withOpacity(0.06)
          : Colors.white.withOpacity(0.7),
      offset: Offset(-depth, -depth),
      blurRadius: blur,
      spreadRadius: spread,
    );

    final darkShadow = BoxShadow(
      color: brightness == Brightness.dark
          ? Colors.black.withOpacity(0.8)
          : Colors.black.withOpacity(0.15),
      offset: Offset(depth, depth),
      blurRadius: blur,
      spreadRadius: spread,
    );

    List<BoxShadow> shadows;
    switch (shape) {
      case NeuShape.flat:
        shadows = const [];
      case NeuShape.concave:
        shadows = [lightShadow, darkShadow]; // inversión para “hueco”
        break;
      case NeuShape.convex:
        shadows = [darkShadow, lightShadow];
        break;
    }

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: shadows,
      ),
      child: child,
    );
  }
}
