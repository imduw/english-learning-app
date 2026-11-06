import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/figma_asset_icon.dart';
import '../widgets/quiz_picture_card.dart';
import '../widgets/vocabulary_exercise_header.dart';

class VocabularyImageResultScreen extends StatelessWidget {
  const VocabularyImageResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 620;
            return Padding(
              padding: EdgeInsets.all(compact ? 14 : 20),
              child: Column(
                children: [
                  const VocabularyExerciseHeader(score: 6, progress: 0.25),
                  Expanded(
                    child: compact
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 280,
                                child: QuizPictureCard(
                                  assetPath:
                                      'assets/images/vocabulary/dog_flower.png',
                                  selected: true,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const _Stars(),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 380,
                                child: QuizPictureCard(
                                  assetPath:
                                      'assets/images/vocabulary/dog_flower.png',
                                  selected: true,
                                ),
                              ),
                              const SizedBox(width: 54),
                              const _Stars(),
                            ],
                          ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Tooltip(
                      message: 'Tiếp tục',
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          AppRoutes.audioImageChoice,
                        ),
                        child: const FigmaAssetIcon(
                          'assets/icons/next.svg',
                          size: 26,
                          color: AppColors.surface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  const _Stars();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, color: Color(0xFFFFB31A), size: 40),
        SizedBox(width: 10),
        Icon(Icons.star_rounded, color: Color(0xFFFFB31A), size: 50),
        SizedBox(width: 10),
        Icon(Icons.star_rounded, color: Color(0xFFFFB31A), size: 40),
      ],
    );
  }
}
