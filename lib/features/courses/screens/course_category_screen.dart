import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../widgets/mobile_learning_shell.dart';

class CourseCategoryScreen extends StatelessWidget {
  const CourseCategoryScreen({super.key});

  static const _categories = [
    'Khóa học toeic 0 - 450',
    'Luyện nghe',
    'Luyện đọc',
    'Luyện nói',
    'Luyện viết',
  ];

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      webFrameSize: const Size(360, 800),
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
            const _CategoryLabel(),
            const SizedBox(height: 18),
            CourseSurfaceCard(
              child: Column(
                children: [
                  for (var index = 0; index < _categories.length; index++)
                    _CategoryRow(
                      index: index,
                      title: _categories[index],
                      onTap: () => Navigator.pushNamed(
                        context,
                        index == 0
                            ? AppRoutes.courseLevels
                            : AppRoutes.courseDiscovery,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryLabel extends StatelessWidget {
  const _CategoryLabel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'Danh mục',
        style: TextStyle(color: Colors.white, fontSize: 13),
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  const _CategoryRow({
    required this.index,
    required this.title,
    required this.onTap,
  });

  final int index;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              '${index + 1}.',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 7),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            CoursePillButton(label: 'Vào học', onPressed: onTap),
          ],
        ),
      ),
    );
  }
}
