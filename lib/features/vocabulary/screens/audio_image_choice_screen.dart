import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/quiz_picture_card.dart';
import '../widgets/vocabulary_exercise_header.dart';

class AudioImageChoiceScreen extends StatefulWidget {
  const AudioImageChoiceScreen({super.key});

  @override
  State<AudioImageChoiceScreen> createState() => _AudioImageChoiceScreenState();
}

class _AudioImageChoiceScreenState extends State<AudioImageChoiceScreen> {
  String? _selected;

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
                  const VocabularyExerciseHeader(score: 0, progress: 0.25),
                  const Spacer(),
                  const Tooltip(
                    message: 'Tệp âm thanh chưa được cung cấp',
                    child: Icon(
                      Icons.volume_up_rounded,
                      color: AppColors.primary,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (compact)
                    Row(
                      children: [
                        Expanded(child: _choice('dog')),
                        const SizedBox(width: 14),
                        Expanded(child: _choice('cat')),
                      ],
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 250, child: _choice('dog')),
                        const SizedBox(width: 28),
                        SizedBox(width: 250, child: _choice('cat')),
                      ],
                    ),
                  const Spacer(),
                  if (_selected == 'dog')
                    Align(
                      alignment: Alignment.centerRight,
                      child: Tooltip(
                        message: 'Tiếp tục',
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            AppRoutes.audioImageResult,
                          ),
                          child: const Icon(Icons.arrow_forward_rounded),
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

  Widget _choice(String answer) {
    return Semantics(
      button: true,
      label: answer == 'dog' ? 'Chọn hình con chó' : 'Chọn hình con mèo',
      child: QuizPictureCard(
        assetPath: answer == 'dog'
            ? 'assets/images/vocabulary/dog_flower.png'
            : 'assets/images/vocabulary/kitten_in_room.png',
        selected: _selected == answer,
        onTap: () => setState(() => _selected = answer),
      ),
    );
  }
}
