import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../widgets/mobile_learning_shell.dart';

class CourseLevelCatalogScreen extends StatefulWidget {
  const CourseLevelCatalogScreen({super.key});

  @override
  State<CourseLevelCatalogScreen> createState() =>
      _CourseLevelCatalogScreenState();
}

class _CourseLevelCatalogScreenState extends State<CourseLevelCatalogScreen> {
  static const _tabs = [
    'Tất cả',
    '0 - 450',
    '450 - 600',
    '600 - 900',
    'Bổ trợ',
  ];
  static const _courses = [
    (
      '0 - 450',
      'Quy hoạch hệ thống',
      'Chiến lược giải đề',
      'Luyện đề thật',
      Color(0xFF4387FF),
    ),
    (
      '450 - 600',
      'Kỹ năng làm bài',
      'Chinh phục điểm yếu',
      'Mở rộng toàn diện',
      Color(0xFFFFD75C),
    ),
    (
      '600 - 900',
      'Chắc chắn đỗ',
      'Nâng cao nền tảng',
      'Củng cố đề thật',
      Color(0xFF6559D9),
    ),
    (
      'Bổ trợ',
      'Cơ bản căn bản',
      'Ngữ pháp chuyên sâu',
      'Nâng cấp toàn diện',
      Color(0xFF35BDEB),
    ),
  ];
  var _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      webFrameSize: const Size(360, 800),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 146,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF9DAF74), Color(0xFFDAE4AF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CourseScreenBackButton(),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.menu_book_rounded,
                              size: 54,
                              color: Color(0xFFF2F6D6),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Tiếng anh đại học',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Sản phẩm từ Hoài Thu, muốn đậu một lần, vượt cấp nhanh, điểm cao, đều có...',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      height: 1.25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(22),
                    ),
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _tabs.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 18),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => setState(() => _selectedTab = index),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _tabs[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: _selectedTab == index
                                    ? const Color(0xFF1F2937)
                                    : const Color(0xFF7C8796),
                                fontWeight: _selectedTab == index
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 4),
                            if (_selectedTab == index)
                              Container(
                                width: 24,
                                height: 2,
                                color: const Color(0xFF2861EF),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
              itemCount: _visibleCourses.length,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final course = _visibleCourses[index];
                return CourseSurfaceCard(
                  child: SizedBox(
                    height: 76,
                    child: Row(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: course.$5,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              color: const Color(0xFFFFF8D8),
                              child: Text(
                                'TOEIC\n${course.$1}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Color(0xFF2465E8),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: [course.$2, course.$3, course.$4]
                                .map(
                                  (tag) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 3,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF1F6FF),
                                    ),
                                    child: Text(
                                      tag,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF3977E7),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CoursePillButton(
                            label: 'Vào học',
                            backgroundColor: const Color(0xFFF04B27),
                            onPressed: () => Navigator.pushNamed(
                              context,
                              AppRoutes.lessonList,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<(String, String, String, String, Color)> get _visibleCourses {
    if (_selectedTab == 0 || _selectedTab == 4) return _courses;
    final selected = _tabs[_selectedTab].replaceAll(' ', '');
    return _courses
        .where((course) => course.$1.replaceAll(' ', '') == selected)
        .toList();
  }
}
