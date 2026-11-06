import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/figma_asset_icon.dart';

class VocabularyExerciseHeader extends StatelessWidget {
  const VocabularyExerciseHeader({
    required this.score,
    required this.progress,
    super.key,
  });

  final int score;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          tooltip: 'Quay lại',
          onPressed: () => Navigator.maybePop(context),
          icon: const FigmaAssetIcon('assets/icons/back.svg', size: 20),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.softBackground,
            fixedSize: const Size(40, 40),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.softBackground,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.softBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FigmaAssetIcon('assets/icons/star.svg', size: 20),
              const SizedBox(width: 5),
              Text(
                '$score',
                style: const TextStyle(
                  color: AppColors.emphasis,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
