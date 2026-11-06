import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../core/theme/app_colors.dart';
import '../../courses/widgets/mobile_learning_shell.dart';

class StoryLevelInfoScreen extends StatelessWidget {
  const StoryLevelInfoScreen({super.key});

  static const _levels = [
    ('A1', 'Đề xuất đọc truyện tranh R1-R2', Color(0xFF91C73E)),
    ('A2', 'Đề xuất đọc truyện tranh R3-R4', Color(0xFFFF9E27)),
    ('B1', 'Đề xuất đọc truyện tranh R5-R6', Color(0xFFFF6576)),
    ('B2', 'Đề xuất đọc truyện tranh R7-R8', Color(0xFF9A65EE)),
    ('C1', 'Đề xuất đọc truyện tranh R9-R10', Color(0xFFFF76A7)),
    ('C2', 'Đề xuất đọc truyện tranh R11-R16', Color(0xFF26BFC6)),
  ];

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      webFrameSize: const Size(360, 800),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
            child: Row(
              children: [
                const CourseScreenBackButton(),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Giải thích cấp độ',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(width: 34),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE7E9ED)),
              ),
              child: Column(
                children: [
                  for (final (index, level) in _levels.indexed)
                    _LevelDescriptionRow(
                      level: level.$1,
                      description: level.$2,
                      color: level.$3,
                      isLast: index == _levels.length - 1,
                    ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(bottom: 28),
            child: Column(
              children: [
                Text(
                  'Hãy cùng bé khám phá thế giới truyện tranh.',
                  style: TextStyle(fontSize: 11, color: Color(0xFF939393)),
                ),
                SizedBox(height: 8),
                Text(
                  'Tận hưởng niềm vui đọc sách!',
                  style: TextStyle(fontSize: 10, color: Color(0xFFAAAAAA)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelDescriptionRow extends StatelessWidget {
  const _LevelDescriptionRow({
    required this.level,
    required this.description,
    required this.color,
    required this.isLast,
  });

  final String level;
  final String description;
  final Color color;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Row(
        children: [
          Container(width: 5, height: double.infinity, color: color),
          SizedBox(
            width: 78,
            child: Center(
              child: Text(level, style: const TextStyle(fontSize: 12, color: Color(0xFF666666))),
            ),
          ),
          const VerticalDivider(width: 1, color: Color(0xFFE7E9ED)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          if (!isLast)
            const PositionedDivider(),
        ],
      ),
    );
  }
}

class PositionedDivider extends StatelessWidget {
  const PositionedDivider({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class StoryLibraryScreen extends StatefulWidget {
  const StoryLibraryScreen({super.key});

  @override
  State<StoryLibraryScreen> createState() => _StoryLibraryScreenState();
}

class _StoryLibraryScreenState extends State<StoryLibraryScreen> {
  static const _levels = ['R1', 'R2', 'R3', 'R4', 'R5', 'R6'];
  var _selectedLevel = 'R1';

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      webFrameSize: const Size(360, 800),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 6),
            child: Row(
              children: [
                const CourseScreenBackButton(),
                const Expanded(
                  child: Center(
                    child: Text('Mở rộng đọc', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(width: 34),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              children: [
                for (final level in _levels)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      label: Text(level, style: const TextStyle(fontSize: 11)),
                      selected: _selectedLevel == level,
                      onSelected: (_) => setState(() => _selectedLevel = level),
                      selectedColor: AppColors.action,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFFD8DDE4)),
                      labelStyle: TextStyle(color: _selectedLevel == level ? Colors.white : const Color(0xFF9098A4)),
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 8),
            child: Row(
              children: [
                PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  tooltip: 'Lọc truyện',
                  onSelected: (_) => setState(() {}),
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'all', child: Text('Tất cả truyện')),
                    PopupMenuItem(value: 'read', child: Text('Đã đọc')),
                    PopupMenuItem(value: 'unread', child: Text('Chưa đọc')),
                  ],
                  child: const Icon(Icons.filter_list_rounded, size: 20),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.storyLevelInfo),
                  icon: const Icon(Icons.help_outline_rounded, size: 13),
                  label: const Text('Giải thích cấp độ', style: TextStyle(fontSize: 10)),
                  style: TextButton.styleFrom(foregroundColor: const Color(0xFF8A96A6), padding: EdgeInsets.zero),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEDEFF2)),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
              itemCount: 7,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 8,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (context, index) => _StoryBookTile(
                onTap: () => Navigator.pushNamed(context, AppRoutes.storyMode),
              ),
            ),
          ),
          _ContinueReadingBar(
            level: _selectedLevel,
            onTap: () => Navigator.pushNamed(context, AppRoutes.storyMode),
          ),
        ],
      ),
    );
  }
}

class _StoryBookTile extends StatelessWidget {
  const _StoryBookTile({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF75C82E), width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/vocabulary/dog_flower.png',
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.15),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Text('My Little Dog', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 9)),
        ],
      ),
    );
  }
}

class _ContinueReadingBar extends StatelessWidget {
  const _ContinueReadingBar({required this.level, required this.onTap});

  final String level;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      margin: const EdgeInsets.fromLTRB(2, 0, 2, 2),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF523321),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset('assets/images/vocabulary/dog_flower.png', width: 38, height: 42, fit: BoxFit.cover),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('My little dog', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
                Text('Đang đọc tới trang 2 • $level', style: const TextStyle(color: Color(0xFFE9CE8E), fontSize: 9)),
              ],
            ),
          ),
          FilledButton.icon(
            onPressed: onTap,
            icon: const Icon(Icons.chevron_right_rounded, size: 16),
            label: const Text('Tiếp tục đọc', style: TextStyle(fontSize: 10)),
            style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF9800), foregroundColor: Colors.white, minimumSize: Size.zero, padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), shape: const StadiumBorder()),
          ),
        ],
      ),
    );
  }
}
