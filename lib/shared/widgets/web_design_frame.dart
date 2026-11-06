import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebDesignFrame extends StatelessWidget {
  const WebDesignFrame({
    required this.designSize,
    required this.child,
    this.backgroundColor = const Color(0xFFE7EBF0),
    super.key,
  });

  final Size designSize;
  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return child;

    return LayoutBuilder(
      builder: (context, constraints) {
        final scale = math.min(
          1.0,
          math.min(
            constraints.maxWidth / designSize.width,
            constraints.maxHeight / designSize.height,
          ),
        );
        return ColoredBox(
          color: backgroundColor,
          child: Center(
            child: SizedBox(
              width: designSize.width * scale,
              height: designSize.height * scale,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
