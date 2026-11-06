import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../courses/widgets/mobile_learning_shell.dart';

class ChildLearningPathScreen extends StatefulWidget {
  const ChildLearningPathScreen({this.showSkillsInitially = false, super.key});

  final bool showSkillsInitially;

  @override
  State<ChildLearningPathScreen> createState() =>
      _ChildLearningPathScreenState();
}

class _ChildLearningPathScreenState extends State<ChildLearningPathScreen> {
  late bool _showSkills = widget.showSkillsInitially;
  var _selectedLevel = 'A1';
  var _selectedUnit = 1;

  static const _levels = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2'];
  static const _lessons = [
    ('Đọc truyện', 'Run', Icons.menu_book_rounded),
    ('Chơi nào!', "Mia, let's play!", Icons.sports_esports_rounded),
    ('Review', "Let's review", Icons.replay_rounded),
    ('Review', 'My little dog', Icons.pets_rounded),
  ];
  static const _skills = [
    (Icons.auto_stories_rounded, 'Truyện'),
    (Icons.text_fields_rounded, 'Ngữ âm'),
    (Icons.translate_rounded, 'Từ vựng'),
    (Icons.headphones_rounded, 'Luyện nghe'),
  ];

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      webFrameSize: const Size(360, 800),
      child: Column(
        children: [
          _ChildCourseHeader(
            selectedLevel: _selectedLevel,
            levels: _levels,
            showSkills: _showSkills,
            onCourseTap: () => Navigator.pushNamed(
              context,
              AppRoutes.courseDiscovery,
            ),
            onToggleSkills: () => setState(() => _showSkills = !_showSkills),
            onLevelSelected: (level) => setState(() => _selectedLevel = level),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 180),
            crossFadeState: _showSkills
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: _SkillPanel(
              skills: _skills,
              onSelect: _openSkill,
            ),
            secondChild: const SizedBox(width: double.infinity, height: 0),
          ),
          _UnitSummary(
            selectedUnit: _selectedUnit,
            showSkills: _showSkills,
            onUnitSelected: (unit) => setState(() => _selectedUnit = unit),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFD8F3FF),
              child: _LessonPath(
                lessons: _lessons,
                levels: _levels,
                onLessonTap: (index) {
                  if (index == 0) {
                    Navigator.pushNamed(context, AppRoutes.storyLibrary);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openSkill(String skill) {
    setState(() => _showSkills = false);
    if (skill == 'Truyện') {
      Navigator.pushNamed(context, AppRoutes.storyLibrary);
    } else if (skill == 'Từ vựng') {
      Navigator.pushNamed(context, AppRoutes.vocabularyReview);
    }
  }
}

class _ChildCourseHeader extends StatelessWidget {
  const _ChildCourseHeader({
    required this.selectedLevel,
    required this.levels,
    required this.showSkills,
    required this.onCourseTap,
    required this.onToggleSkills,
    required this.onLevelSelected,
  });

  final String selectedLevel;
  final List<String> levels;
  final bool showSkills;
  final VoidCallback onCourseTap;
  final VoidCallback onToggleSkills;
  final ValueChanged<String> onLevelSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFB9E6FB),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tiếng Anh thiếu nhi',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF173B5A),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Dành riêng cho lứa tuổi 6-12',
                      style: TextStyle(fontSize: 10, color: Color(0xFF52718A)),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: onCourseTap,
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9800),
                  foregroundColor: Colors.white,
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  shape: const StadiumBorder(),
                ),
                child: const Row(
                  children: [
                    Text('Khóa học', style: TextStyle(fontSize: 11)),
                    SizedBox(width: 4),
                    Icon(Icons.chevron_right_rounded, size: 16),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF55B5EF),
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(color: const Color(0xFF8DD6FF)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var index = 0; index < 19; index++)
                          Container(
                            width: 2,
                            height: 7,
                            color: const Color(0xFFB7E7FF),
                          ),
                      ],
                    ),
                    Positioned(
                      left: 30,
                      child: Container(
                        width: 30,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFF237DB5)),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Icon(
                          Icons.toys_rounded,
                          size: 15,
                          color: Color(0xFF168BD0),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 72,
                      child: InkWell(
                        onTap: onToggleSkills,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1BA6EF),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            showSkills ? 'Đóng' : 'Mở',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                tooltip: 'Mở danh mục kỹ năng',
                visualDensity: VisualDensity.compact,
                onPressed: onToggleSkills,
                icon: const Icon(Icons.tune_rounded, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (final level in levels)
                InkWell(
                  onTap: () => onLevelSelected(level),
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: selectedLevel == level
                          ? const Color(0xFF25A9F1)
                          : Colors.white.withValues(alpha: 0.45),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      level,
                      style: TextStyle(
                        color: selectedLevel == level
                            ? Colors.white
                            : const Color(0xFF158BD0),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillPanel extends StatelessWidget {
  const _SkillPanel({required this.skills, required this.onSelect});

  final List<(IconData, String)> skills;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFB9E6FB),
      padding: const EdgeInsets.fromLTRB(12, 2, 12, 10),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final skill in skills)
            SizedBox(
              width: 92,
              height: 60,
              child: OutlinedButton(
                onPressed: () => onSelect(skill.$2),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF27384A),
                  side: const BorderSide(color: Color(0xFF27384A)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(skill.$1, size: 22),
                    const SizedBox(height: 2),
                    Text(skill.$2, style: const TextStyle(fontSize: 10)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _UnitSummary extends StatelessWidget {
  const _UnitSummary({
    required this.selectedUnit,
    required this.showSkills,
    required this.onUnitSelected,
  });

  final int selectedUnit;
  final bool showSkills;
  final ValueChanged<int> onUnitSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: showSkills
                ? const Color(0xFF16B9F4)
                : const Color(0xFFD8F3FF),
            width: showSkills ? 3 : 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Unit 1',
                style: TextStyle(
                  color: Color(0xFF0098DC),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  '16 mẫu câu  45 từ',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                ),
              ),
              TextButton(
                onPressed: () => onUnitSelected(selectedUnit % 4 + 1),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF27B6F2),
                  foregroundColor: Colors.white,
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  shape: const StadiumBorder(),
                ),
                child: const Text('A1  ›', style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Học tự giới thiệu; miêu tả đồ vật xung quanh, địa điểm và nhân vật.',
            style: TextStyle(fontSize: 10, color: Color(0xFF546477)),
          ),
          if (showSkills) ...[
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => onUnitSelected(selectedUnit % 4 + 1),
                child: const Text('1-450 điểm  ›', style: TextStyle(fontSize: 10)),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _LessonPath extends StatelessWidget {
  const _LessonPath({
    required this.lessons,
    required this.levels,
    required this.onLessonTap,
  });

  final List<(String, String, IconData)> lessons;
  final List<String> levels;
  final ValueChanged<int> onLessonTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: SizedBox(
          height: 610,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(painter: _RoadmapConnectorPainter()),
              ),
              Positioned(
                top: 16,
                right: 0,
                bottom: 20,
                child: Container(
                  width: 24,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFD0EEFA),
                    shape: StadiumBorder(),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (final level in levels)
                        RotatedBox(
                          quarterTurns: 0,
                          child: Text(
                            level,
                            style: const TextStyle(
                              color: Color(0xFF099BDC),
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              for (var index = 0; index < lessons.length; index++)
                _LessonNode(
                  index: index,
                  lesson: lessons[index],
                  left: index.isEven ? 36 : 126,
                  top: 28 + index * 138,
                  onTap: () => onLessonTap(index),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LessonNode extends StatelessWidget {
  const _LessonNode({
    required this.index,
    required this.lesson,
    required this.left,
    required this.top,
    required this.onTap,
  });

  final int index;
  final (String, String, IconData) lesson;
  final double left;
  final double top;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: 38,
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: index == 0 ? const Color(0xFF62C945) : const Color(0xFFE7EBF0),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Color(0x552D5365), offset: Offset(0, 5), blurRadius: 2),
                ],
              ),
              child: Icon(
                index == 0 ? lesson.$3 : Icons.lock_rounded,
                color: index == 0 ? Colors.white : const Color(0xFFB6C0CB),
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 58,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFFC899)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(lesson.$1, style: const TextStyle(fontSize: 9, color: Color(0xFF9AA4B2))),
                    Text(lesson.$2, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoadmapConnectorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(64, 82)
      ..cubicTo(64, 146, 210, 146, 126, 220)
      ..cubicTo(76, 286, 80, 326, 132, 358)
      ..cubicTo(200, 406, 220, 454, 106, 500);
    final paint = Paint()
      ..color = const Color(0xFF64CFFF)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = (distance + 6).clamp(0, metric.length).toDouble();
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance += 11;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
