import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreenNeumorphic extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const LoginScreenNeumorphic({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double maxCardWidth = screenWidth < 600 ? screenWidth * 0.9 : 400;

    final Color baseColor = isDark
        ? const Color(0xFF121212)
        : const Color(0xFFF0F0F3);
    final Color cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final Color textColor = isDark ? Colors.white : Colors.black87;
    final Color accentColor = Colors.cyanAccent;

    return Scaffold(
      backgroundColor: baseColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: maxCardWidth,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // LOGO escalable
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: screenWidth < 600 ? 280 : 420,
                    maxHeight: screenWidth < 600 ? 200 : 320,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),

                const SizedBox(height: 12),

                // SLOGAN
                Text(
                  "Conecta. Juega. Compite.",
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: screenWidth < 600 ? 14 : 16,
                  ),
                ),

                const SizedBox(height: 28),

                // BOTÓN GOOGLE
                _buildOAuthButton(
                  icon: Icons.g_mobiledata,
                  text: "Continuar con Google",
                  onTap: () {},
                  backgroundColor: cardColor,
                  textColor: textColor,
                ),
                const SizedBox(height: 16),

                // BOTÓN APPLE
                _buildOAuthButton(
                  icon: FontAwesomeIcons.instagram,
                  text: "Continuar con Instagram",
                  onTap: () {},
                  backgroundColor: cardColor,
                  textColor: textColor,
                ),
                const SizedBox(height: 32),

                // SEPARADOR
                Row(
                  children: [
                    Expanded(child: Divider(color: textColor.withOpacity(0.2))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "o",
                        style: TextStyle(color: textColor.withOpacity(0.6)),
                      ),
                    ),
                    Expanded(child: Divider(color: textColor.withOpacity(0.2))),
                  ],
                ),
                const SizedBox(height: 16),

                // INPUTS
                _buildInput(
                  hintText: 'Correo electrónico',
                  isDark: isDark,
                  cardColor: cardColor,
                  textColor: textColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 16),
                _buildInput(
                  hintText: 'Contraseña',
                  obscureText: true,
                  isDark: isDark,
                  cardColor: cardColor,
                  textColor: textColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 24),

                // BOTÓN REGISTRO
                _buildRoundedButton(
                  text: "Registrarse con Email",
                  backgroundColor: accentColor,
                ),
                const SizedBox(height: 16),

                // ENLACE LOGIN
                Text.rich(
                  TextSpan(
                    text: "¿Ya tienes una cuenta? ",
                    style: TextStyle(color: textColor.withOpacity(0.6)),
                    children: [
                      TextSpan(
                        text: "Inicia sesión",
                        style: TextStyle(color: accentColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // TOGGLE TEMA
                IconButton(
                  icon: Icon(
                    isDark ? Icons.wb_sunny : Icons.nights_stay,
                    color: accentColor,
                  ),
                  onPressed: onToggleTheme,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput({
    required String hintText,
    required bool isDark,
    required Color cardColor,
    required Color textColor,
    required Color accentColor,
    bool obscureText = false,
  }) {
    return TextFormField(
      obscureText: obscureText,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: cardColor,
        hintText: hintText,
        hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: accentColor, width: 2),
        ),
      ),
    );
  }

  Widget _buildRoundedButton({
    required String text,
    required Color backgroundColor,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [backgroundColor, Colors.cyan]),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildOAuthButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovered = false;

        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(2, 2),
                          blurRadius: 8,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.08),
                          offset: const Offset(-2, -2),
                          blurRadius: 8,
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: const Offset(4, 4),
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.05),
                          offset: const Offset(-4, -4),
                          blurRadius: 10,
                        ),
                      ],
              ),
              child: Row(
                children: [
                  Icon(icon, color: textColor),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(color: textColor, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
