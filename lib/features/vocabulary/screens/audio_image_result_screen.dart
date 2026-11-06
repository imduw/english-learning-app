import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/figma_asset_icon.dart';
import '../widgets/quiz_picture_card.dart';
import '../widgets/vocabulary_exercise_header.dart';

class AudioImageResultScreen extends StatelessWidget {
  const AudioImageResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const VocabularyExerciseHeader(score: 3, progress: 0.25),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 390),
                    child: const QuizPictureCard(
                      assetPath: 'assets/images/vocabulary/dog_flower.png',
                      selected: true,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Tooltip(
                  message: 'Tiếp tục',
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.pictureStory),
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
        ),
      ),
    );
  }
}
