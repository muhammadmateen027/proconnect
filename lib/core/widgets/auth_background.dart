import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:proconnect/core/theme/app_colors.dart';

/// Variants for the authentication background style
enum AuthBackgroundVariant {
  /// Premium glassmorphism with mesh gradient blobs (Vibrant & Playful)
  glassMesh,

  /// Soft, dreamy aurora-inspired colors (Sophisticated & Calm)
  aurora,

  /// Clean, split-tone gradient with minimal noise
  minimalGradient,

  /// Modern geometric shapes and patterns
  modernShapes,

  /// Soft, flowing abstract waves
  abstractWaves,
}

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    required this.child,
    this.variant = AuthBackgroundVariant.glassMesh,
    super.key,
  });

  final Widget child;
  final AuthBackgroundVariant variant;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Stack(
        children: [
          _buildBackground(context, isDark),
          _buildContent(context, isDark),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context, bool isDark) {
    switch (variant) {
      case AuthBackgroundVariant.glassMesh:
        return _MeshBackground(isDark: isDark);
      case AuthBackgroundVariant.aurora:
        return _AuroraBackground(isDark: isDark);
      case AuthBackgroundVariant.minimalGradient:
        return _MinimalGradientBackground(isDark: isDark);
      case AuthBackgroundVariant.modernShapes:
        return _ShapesBackground(isDark: isDark);
      case AuthBackgroundVariant.abstractWaves:
        return _WavesBackground(isDark: isDark);
    }
  }

  Widget _buildContent(BuildContext context, bool isDark) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 450),
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  // Sophisticated glass gradient (light reflection)
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDark
                        ? [
                            Colors.white.withOpacity(0.08),
                            Colors.white.withOpacity(0.02),
                          ]
                        : [
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(0.3),
                          ],
                  ),
                  borderRadius: BorderRadius.circular(32),
                  // Multi-layered border for depth
                  border: Border.all(
                    color: isDark
                        ? Colors.white.withOpacity(0.12)
                        : Colors.white.withOpacity(0.6),
                    width: 1.5,
                  ),
                  boxShadow: [
                    // Deep outer shadow
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 50,
                      spreadRadius: -10,
                      offset: const Offset(0, 25),
                    ),
                    // Inner glow (simulated)
                    BoxShadow(
                      color: isDark
                          ? Colors.white.withOpacity(0.02)
                          : Colors.white.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: -5,
                      offset: const Offset(-5, -5),
                    ),
                  ],
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// --- BACKGROUND IMPLEMENTATIONS ---

class _MeshBackground extends StatelessWidget {
  const _MeshBackground({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [const Color(0xFF1E1B4B), const Color(0xFF312E81)]
                  : [const Color(0xFFE0E7FF), const Color(0xFFC7D2FE)],
            ),
          ),
        ),
        Positioned(
          top: -100,
          left: -50,
          child: _Blob(
            size: 400,
            color: const Color(0xFF6366F1).withOpacity(isDark ? 0.3 : 0.2),
          ),
        ),
        Positioned(
          bottom: -150,
          right: -100,
          child: _Blob(
            size: 500,
            color: const Color(0xFF8B5CF6).withOpacity(isDark ? 0.25 : 0.15),
          ),
        ),
        Positioned(
          top: 200,
          right: -50,
          child: _Blob(
            size: 300,
            color: const Color(0xFFEC4899).withOpacity(isDark ? 0.15 : 0.1),
          ),
        ),
      ],
    );
  }
}

class _AuroraBackground extends StatelessWidget {
  const _AuroraBackground({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [const Color(0xFF0F172A), const Color(0xFF1E293B)]
                  : [const Color(0xFFF1F5F9), const Color(0xFFE2E8F0)],
            ),
          ),
        ),
        Positioned(
          top: -200,
          right: -100,
          child: _Blob(
            size: 600,
            color: const Color(0xFF2DD4BF).withOpacity(isDark ? 0.15 : 0.1),
          ),
        ),
        Positioned(
          bottom: -100,
          left: -100,
          child: _Blob(
            size: 500,
            color: const Color(0xFF818CF8).withOpacity(isDark ? 0.2 : 0.15),
          ),
        ),
        Positioned(
          top: 100,
          left: -50,
          child: _Blob(
            size: 400,
            color: const Color(0xFFFB7185).withOpacity(isDark ? 0.1 : 0.05),
          ),
        ),
      ],
    );
  }
}

class _MinimalGradientBackground extends StatelessWidget {
  const _MinimalGradientBackground({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [const Color(0xFF1A1A1A), const Color(0xFF000000)]
              : [const Color(0xFFF8FAFC), const Color(0xFFE2E8F0)],
        ),
      ),
    );
  }
}

class _ShapesBackground extends StatelessWidget {
  const _ShapesBackground({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final color = isDark ? Colors.white10 : Colors.black.withOpacity(0.03);
    return Stack(
      children: [
        _MinimalGradientBackground(isDark: isDark),
        Positioned(
          top: 40,
          left: 40,
          child: Transform.rotate(
            angle: math.pi / 4,
            child: Container(width: 100, height: 100, color: color),
          ),
        ),
        Positioned(
          bottom: 100,
          right: -20,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 20),
            ),
          ),
        ),
        Positioned(
          top: 300,
          right: 50,
          child: _Triangle(size: 80, color: color),
        ),
      ],
    );
  }
}

class _WavesBackground extends StatelessWidget {
  const _WavesBackground({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _MinimalGradientBackground(isDark: isDark),
        Opacity(
          opacity: 0.3,
          child: CustomPaint(
            painter: _WavePainter(
              color: isDark ? AppColors.primaryDark : AppColors.primaryLight,
            ),
            child: Container(),
          ),
        ),
      ],
    );
  }
}

/// --- HELPERS ---

class _Blob extends StatelessWidget {
  const _Blob({required this.size, required this.color});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class _Triangle extends StatelessWidget {
  const _Triangle({required this.size, required this.color});
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _TrianglePainter(color: color),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  _TrianglePainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _WavePainter extends CustomPainter {
  _WavePainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.65,
        size.width * 0.5,
        size.height * 0.75,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.85,
        size.width,
        size.height * 0.75,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
