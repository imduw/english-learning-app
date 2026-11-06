import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/figma_asset_icon.dart';
import '../widgets/quiz_picture_card.dart';
import '../widgets/vocabulary_exercise_header.dart';

class VocabularyImageChoiceScreen extends StatefulWidget {
  const VocabularyImageChoiceScreen({super.key});

  @override
  State<VocabularyImageChoiceScreen> createState() =>
      _VocabularyImageChoiceScreenState();
}

class _VocabularyImageChoiceScreenState
    extends State<VocabularyImageChoiceScreen> {
  String? _answer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 620;
            final picture = const QuizPictureCard(
              assetPath: 'assets/images/vocabulary/dog_flower.png',
            );
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 840),
                child: Padding(
                  padding: EdgeInsets.all(compact ? 14 : 20),
                  child: Column(
                    children: [
                      const VocabularyExerciseHeader(score: 6, progress: 0.25),
                      const SizedBox(height: 18),
                      Expanded(
                        child: compact
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(child: picture),
                                  const SizedBox(height: 12),
                                  _answerList(context),
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(flex: 6, child: picture),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    flex: 5,
                                    child: _answerList(context),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _answerList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final answer in const ['Bee', 'Dog', 'Cat']) ...[
          _WordAnswerTile(
            label: answer,
            selected: _answer == answer,
            correct: _answer == answer && answer == 'Dog',
            incorrect: _answer == answer && answer != 'Dog',
            onTap: () => setState(() => _answer = answer),
          ),
          if (answer != 'Cat') const SizedBox(height: 14),
        ],
        if (_answer == 'Dog') ...[
          const SizedBox(height: 12),
          const _RewardStars(),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Tooltip(
              message: 'Tiếp tục',
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRoutes.vocabularyImageResult,
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
      ],
    );
  }
}

class _WordAnswerTile extends StatelessWidget {
  const _WordAnswerTile({
    required this.label,
    required this.selected,
    required this.correct,
    required this.incorrect,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final bool correct;
  final bool incorrect;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final background = correct
        ? AppColors.positive
        : incorrect
        ? const Color(0xFFFF7777)
        : AppColors.surface;
    final border = correct
        ? const Color(0xFF2BAA61)
        : incorrect
        ? const Color(0xFFE44E5B)
        : const Color(0xFF9DDEFF);
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Material(
        color: background,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: border, width: selected ? 2 : 1.5),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x16387DB9),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: correct || incorrect
                            ? AppColors.surface
                            : AppColors.content,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.volume_up_rounded,
                  size: 18,
                  color: correct || incorrect
                      ? AppColors.surface
                      : AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RewardStars extends StatelessWidget {
  const _RewardStars();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star_rounded, color: Color(0xFFFFB31A), size: 34),
        SizedBox(width: 10),
        Icon(Icons.star_rounded, color: Color(0xFFFFB31A), size: 42),
        SizedBox(width: 10),
        Icon(Icons.star_rounded, color: Color(0xFFFFB31A), size: 34),
      ],
    );
  }
}
