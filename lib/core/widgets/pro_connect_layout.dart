import 'dart:ui';
import 'package:flutter/material.dart';

class ProConnectLayout extends StatelessWidget {
  const ProConnectLayout({
    required this.child,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.useGlass = true,
    this.centerContent = false,
    this.useScrolling = true,
    super.key,
  });

  final Widget child;
  final AppBar? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final bool useGlass;
  final bool centerContent;
  final bool useScrolling;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar != null
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(color: Colors.transparent),
                ),
              ),
              title: appBar!.title,
              actions: appBar!.actions,
              leading: appBar!.leading,
              bottom: appBar!.bottom,
            )
          : null,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Premium Glass Mesh Background (Vibrant colors)
          _MeshBackground(isDark: isDark),

          // Content
          _buildBody(context, isDark),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, bool isDark) {
    final mediaQuery = MediaQuery.of(context);
    final statusBarHeight = mediaQuery.padding.top;
    final appBarHeight = appBar != null ? appBar!.preferredSize.height : 0.0;
    final topOffset = statusBarHeight + appBarHeight;

    var content = child;

    if (useGlass) {
      content = ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            constraints: centerContent
                ? const BoxConstraints(maxWidth: 450)
                : null,
            margin: centerContent
                ? const EdgeInsets.all(24)
                : const EdgeInsets.fromLTRB(16, 8, 16, 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                        Colors.white.withValues(alpha: 0.08),
                        Colors.white.withValues(alpha: 0.02),
                      ]
                    : [
                        Colors.white.withValues(alpha: 0.8),
                        Colors.white.withValues(alpha: 0.3),
                      ],
              ),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.12)
                    : Colors.white.withValues(alpha: 0.6),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 40,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: content,
          ),
        ),
      );
    }

    final finalBaseContent = content;

    if (useScrolling) {
      content = LayoutBuilder(
        builder: (context, constraints) {
          final topPadding = topOffset + 16;
          final bottomPadding = mediaQuery.padding.bottom + 24;

          final availableHeight = constraints.hasBoundedHeight
              ? constraints.maxHeight
              : mediaQuery.size.height;
          final minHeight = (availableHeight - topPadding - bottomPadding)
              .clamp(0.0, double.infinity);

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              top: topPadding,
              bottom: bottomPadding,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: minHeight),
              child: centerContent
                  ? Center(child: finalBaseContent)
                  : finalBaseContent,
            ),
          );
        },
      );
    } else {
      if (centerContent) {
        content = Center(child: content);
      }
      content = Padding(
        padding: EdgeInsets.only(
          top: topOffset,
          bottom: mediaQuery.padding.bottom,
        ),
        child: content,
      );
    }

    return content;
  }
}

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
            color: const Color(
              0xFF6366F1,
            ).withValues(alpha: isDark ? 0.3 : 0.2),
          ),
        ),
        Positioned(
          bottom: -150,
          right: -100,
          child: _Blob(
            size: 500,
            color: const Color(
              0xFF8B5CF6,
            ).withValues(alpha: isDark ? 0.25 : 0.15),
          ),
        ),
        Positioned(
          top: 200,
          right: -50,
          child: _Blob(
            size: 300,
            color: const Color(
              0xFFEC4899,
            ).withValues(alpha: isDark ? 0.15 : 0.1),
          ),
        ),
      ],
    );
  }
}

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
