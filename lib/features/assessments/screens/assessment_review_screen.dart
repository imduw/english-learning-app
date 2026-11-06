import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../courses/widgets/mobile_learning_shell.dart';
import '../widgets/assessment_question_grid.dart';

class AssessmentReviewScreen extends StatelessWidget {
  const AssessmentReviewScreen({this.selectedAnswers, super.key});

  final Map<int, String>? selectedAnswers;

  @override
  Widget build(BuildContext context) {
    final answers = selectedAnswers ?? assessmentInitialAnswers;
    final correctCount = answers.entries
        .where((entry) => assessmentCorrectAnswers[entry.key] == entry.value)
        .length;
    return MobileLearningShell(
      webFrameSize: const Size(360, 800),
      showBottomNavigation: false,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const _AssessmentReviewBanner(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
                  child: Row(
                    children: [
                      const _ToeicCourseBadge(),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bài 1: Giới thiệu - Lộ trình tự học toeic 0 - 450 (4 kỹ năng)',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$correctCount / 10 câu đúng',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF8A96A6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 8),
                  child: Text(
                    'Bài tập (cuối video)',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    '(Kết quả câu trả lời)',
                    style: TextStyle(fontSize: 11, color: Color(0xFF786657)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AssessmentQuestionGrid(
                    answers: answers,
                    showResult: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Divider(color: Color(0xFFE1E6EC)),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(28, 4, 20, 6),
                  child: Text(
                    'Bình luận & Thảo luận     2',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(28, 0, 28, 14),
                  child: TextField(
                    minLines: 2,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Chia sẻ thắc mắc hoặc cảm nghĩ của bạn về bài học...',
                      hintStyle: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF9BAAC0),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 12),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: FilledButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.courseCategory,
                  (route) => route.isFirst,
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7900),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Hoàn tất',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToeicCourseBadge extends StatelessWidget {
  const _ToeicCourseBadge();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        'assets/images/courses/toeic_450_art.png',
        width: 82,
        height: 82,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _AssessmentReviewBanner extends StatelessWidget {
  const _AssessmentReviewBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFE6E9ED))),
      ),
      child: Image.asset(
        'assets/images/courses/study4_toeic_banner.png',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}
