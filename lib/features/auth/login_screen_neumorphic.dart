import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/gestures.dart';
import '../../routing/nav_helper.dart';
import '../../l10n/app_localizations.dart';

class LoginScreenNeumorphic extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const LoginScreenNeumorphic({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double maxCardWidth = screenWidth < 600 ? screenWidth * 0.9 : 400;

    final Color baseColor = Theme.of(context).colorScheme.background;
    final Color cardColor = Theme.of(context).colorScheme.surface;
    final Color textColor = Theme.of(context).colorScheme.onSurface;
    final Color accentColor = Theme.of(context).colorScheme.secondary;

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
                  AppLocalizations.of(context)!.loginSlogan,
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: screenWidth < 600 ? 14 : 16,
                  ),
                ),

                const SizedBox(height: 28),

                // BOTÓN GOOGLE
                _buildOAuthButton(
                  icon: Icons.g_mobiledata,
                  text: AppLocalizations.of(context)!.loginContinueWithGoogle,
                  onTap: () {},
                  backgroundColor: cardColor,
                  textColor: textColor,
                ),
                const SizedBox(height: 16),

                // BOTÓN APPLE
                _buildOAuthButton(
                  icon: FontAwesomeIcons.instagram,
                  text: AppLocalizations.of(
                    context,
                  )!.loginContinueWithInstagram,
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
                        AppLocalizations.of(context)!.loginOr,
                        style: TextStyle(color: textColor.withOpacity(0.6)),
                      ),
                    ),
                    Expanded(child: Divider(color: textColor.withOpacity(0.2))),
                  ],
                ),
                const SizedBox(height: 16),

                // INPUTS
                _buildInput(
                  hintText: AppLocalizations.of(context)!.loginEmail,
                  isDark: isDark,
                  cardColor: cardColor,
                  textColor: textColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 16),
                _buildInput(
                  hintText: AppLocalizations.of(context)!.loginPassword,
                  obscureText: true,
                  isDark: isDark,
                  cardColor: cardColor,
                  textColor: textColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 24),

                // BOTÓN REGISTRO
                _buildRoundedButton(
                  text: AppLocalizations.of(context)!.loginRegisterWithEmail,
                  backgroundColor: accentColor,
                ),
                const SizedBox(height: 16),

                // ENLACE LOGIN
                RichText(
                  text: TextSpan(
                    text:
                        AppLocalizations.of(context)!.loginAlreadyHaveAccount +
                        ' ',
                    style: TextStyle(color: textColor.withOpacity(0.6)),
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.loginSignIn,
                        style: TextStyle(
                          color: isDark ? Color(0xFF20E3B2) : Color(0xFF4ABDAC),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.openOnboarding(); // Navega a onboarding
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // TOGGLE TEMA
                IconButton(
                  icon: Icon(
                    isDark ? Icons.wb_sunny : Icons.nights_stay,
                    color: isDark ? Colors.amber : Colors.indigo,
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
    return Builder(
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final Color buttonColor = isDark
            ? const Color(0xFF20E3B2) // verde-azul neón en oscuro
            : const Color(0xFF4ABDAC); // verde agua en claro
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 8,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
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
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final Color buttonColor = isDark
            ? const Color(0xFF232946) // azul oscuro neutro
            : Colors.white;
        final Color iconColor = isDark
            ? const Color(0xFF20E3B2) // verde-azul neón
            : const Color(0xFF4ABDAC); // verde agua
        final Color labelColor = isDark
            ? Colors.white
            : const Color(0xFF22223B);
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.18),
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
                          color: Colors.black.withOpacity(0.10),
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
                  Icon(icon, color: iconColor),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: labelColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
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
