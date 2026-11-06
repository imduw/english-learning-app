import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../widgets/mobile_learning_shell.dart';

class LessonListScreen extends StatelessWidget {
  const LessonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CourseScreenBackButton(),
            const SizedBox(height: 12),
            Text('Hi, DOGITA', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            const Text(
              'Hy vọng bạn có những trải nghiệm thật tốt khi học khóa học',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF8493A8),
                height: 1.25,
              ),
            ),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Danh mục',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
            const SizedBox(height: 18),
            const CourseSurfaceCard(
              child: Column(
                children: [
                  _LessonRow(number: 1, title: 'Bài 1', unlocked: true),
                  _LessonRow(number: 2, title: 'Bài 2', unlocked: false),
                  _LessonRow(number: 3, title: 'Bài 3', unlocked: false),
                  _LessonRow(number: 4, title: 'Bài 4', unlocked: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LessonRow extends StatelessWidget {
  const _LessonRow({
    required this.number,
    required this.title,
    required this.unlocked,
  });

  final int number;
  final String title;
  final bool unlocked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              '$number.',
              style: TextStyle(
                color: unlocked
                    ? const Color(0xFF1F2937)
                    : const Color(0xFF9BAAC0),
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: unlocked
                      ? const Color(0xFF1F2937)
                      : const Color(0xFF9BAAC0),
                  fontSize: 13,
                  fontWeight: unlocked ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
            if (unlocked)
              CoursePillButton(
                label: 'Vào học',
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.assessment),
              )
            else
              const Icon(
                Icons.lock_outline_rounded,
                size: 15,
                color: Color(0xFFC5D0DE),
              ),
          ],
        ),
      ),
    );
  }
}
