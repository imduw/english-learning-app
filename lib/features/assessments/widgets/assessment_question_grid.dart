import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

const assessmentCorrectAnswers = <int, String>{
  1: 'A',
  2: 'B',
  3: 'C',
  4: 'D',
  5: 'A',
  6: 'A',
  7: 'B',
  8: 'C',
  9: 'D',
  10: 'A',
};

const assessmentInitialAnswers = <int, String>{
  1: 'A',
  2: 'B',
  3: 'C',
  4: 'D',
  5: 'A',
  6: 'B',
  7: 'C',
  8: 'D',
  9: 'A',
  10: 'B',
};

class AssessmentQuestionGrid extends StatelessWidget {
  const AssessmentQuestionGrid({
    required this.answers,
    this.showResult = false,
    this.onAnswerSelected,
    super.key,
  });

  final Map<int, String> answers;
  final bool showResult;
  final void Function(int question, String answer)? onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _QuestionColumn(
            start: 1,
            answers: answers,
            showResult: showResult,
            onAnswerSelected: onAnswerSelected,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _QuestionColumn(
            start: 6,
            answers: answers,
            showResult: showResult,
            onAnswerSelected: onAnswerSelected,
          ),
        ),
      ],
    );
  }
}

class _QuestionColumn extends StatelessWidget {
  const _QuestionColumn({
    required this.start,
    required this.answers,
    required this.showResult,
    required this.onAnswerSelected,
  });

  final int start;
  final Map<int, String> answers;
  final bool showResult;
  final void Function(int question, String answer)? onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF0F2F5)),
      ),
      child: Column(
        children: [
          const _AnswerHeader(),
          const Divider(height: 8, color: Color(0xFFE4E9EF)),
          for (var offset = 0; offset < 5; offset++)
            _QuestionRow(
              number: start + offset,
              answer: answers[start + offset],
              showResult: showResult,
              onAnswerSelected: onAnswerSelected,
            ),
        ],
      ),
    );
  }
}

class _AnswerHeader extends StatelessWidget {
  const _AnswerHeader();

  @override
  Widget build(BuildContext context) {
    const options = ['A', 'B', 'C', 'D'];
    return Row(
      children: [
        const SizedBox(
          width: 23,
          child: Text(
            'No.',
            style: TextStyle(fontSize: 9, color: Color(0xFF687386)),
          ),
        ),
        for (final option in options)
          Expanded(
            child: Center(
              child: Text(
                option,
                style: const TextStyle(fontSize: 9, color: Color(0xFF687386)),
              ),
            ),
          ),
      ],
    );
  }
}

class _QuestionRow extends StatelessWidget {
  const _QuestionRow({
    required this.number,
    required this.answer,
    required this.showResult,
    required this.onAnswerSelected,
  });

  final int number;
  final String? answer;
  final bool showResult;
  final void Function(int question, String answer)? onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    const options = ['A', 'B', 'C', 'D'];
    final isCorrect = answer == assessmentCorrectAnswers[number];
    final resultColor = isCorrect
        ? const Color(0xFF2DC374)
        : const Color(0xFFE05252);
    return SizedBox(
      height: 28,
      child: Row(
        children: [
          SizedBox(
            width: 23,
            child: Row(
              children: [
                if (showResult)
                  Icon(
                    isCorrect ? Icons.check_rounded : Icons.close_rounded,
                    size: 12,
                    color: resultColor,
                  ),
                Expanded(
                  child: Text(
                    number.toString().padLeft(2, '0'),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          for (final option in options)
            Expanded(
              child: Center(
                child: InkWell(
                  onTap: showResult
                      ? null
                      : () => onAnswerSelected?.call(number, option),
                  customBorder: const CircleBorder(),
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: answer == option
                          ? showResult
                                ? resultColor
                                : AppColors.action
                          : const Color(0xFFEAF0FF),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 9,
                        color: answer == option
                            ? Colors.white
                            : const Color(0xFF5F6E82),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
