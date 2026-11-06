import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../courses/widgets/mobile_learning_shell.dart';
import '../widgets/assessment_question_grid.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  final _answers = Map<int, String>.of(assessmentInitialAnswers);
  final _commentController = TextEditingController();
  var _commentOrder = 'Mới nhất';

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      webFrameSize: const Size(360, 800),
      showBottomNavigation: false,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const _AssessmentBanner(),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 14, 16, 6),
                  child: _CourseSummary(),
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
                    '(Chọn 1 đáp án A, B, C hoặc D)',
                    style: TextStyle(fontSize: 11, color: Color(0xFF786657)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AssessmentQuestionGrid(
                    answers: _answers,
                    onAnswerSelected: (question, answer) {
                      setState(() => _answers[question] = answer);
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Divider(color: Color(0xFFE1E6EC)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 16, 6),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Bình luận & Thảo luận',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: const ShapeDecoration(
                          color: Color(0xFFE9EDF2),
                          shape: StadiumBorder(),
                        ),
                        child: const Text('2', style: TextStyle(fontSize: 9)),
                      ),
                      const SizedBox(width: 8),
                      PopupMenuButton<String>(
                        initialValue: _commentOrder,
                        padding: EdgeInsets.zero,
                        onSelected: (value) =>
                            setState(() => _commentOrder = value),
                        itemBuilder: (context) => const [
                          PopupMenuItem(
                            value: 'Mới nhất',
                            child: Text('Mới nhất'),
                          ),
                          PopupMenuItem(
                            value: 'Cũ nhất',
                            child: Text('Cũ nhất'),
                          ),
                        ],
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _commentOrder,
                              style: const TextStyle(fontSize: 10),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 0, 28, 14),
                  child: TextField(
                    controller: _commentController,
                    minLines: 2,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Chia sẻ thắc mắc hoặc cảm nghĩ của bạn về bài học...',
                      hintStyle: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF9BAAC0),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFDCE4ED)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFDCE4ED)),
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
                onPressed: () => Navigator.pushNamed(
                  context,
                  AppRoutes.assessmentReview,
                  arguments: Map<int, String>.of(_answers),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7900),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Submit',
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

class _AssessmentBanner extends StatelessWidget {
  const _AssessmentBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
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

class _CourseSummary extends StatelessWidget {
  const _CourseSummary();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/courses/toeic_450_art.png',
            width: 82,
            height: 82,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bài 1: Giới thiệu - Lộ trình tự học toeic 0 - 450 (4 kỹ năng)',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '350k người học',
                style: TextStyle(fontSize: 11, color: Color(0xFF8A96A6)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
