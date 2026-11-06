import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class QuizPictureCard extends StatelessWidget {
  const QuizPictureCard({
    required this.assetPath,
    this.selected = false,
    this.onTap,
    this.width,
    super.key,
  });

  final String assetPath;
  final bool selected;
  final VoidCallback? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final borderColor = selected ? AppColors.positive : const Color(0xFF72D0FF);
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor, width: 2),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1B387DB9),
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: AspectRatio(
            aspectRatio: 1.65,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
