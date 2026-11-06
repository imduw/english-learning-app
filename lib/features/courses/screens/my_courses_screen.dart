import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../widgets/mobile_learning_shell.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  var _selectedFilter = 0;
  static const _filters = ['Tất cả', 'Chưa hoàn thành', 'Đã hoàn thành'];
  static const _courses = [
    (
      'Kế hoạch nâng cao từ vựng THCS (Bản trải nghiệm)',
      Color(0xFF4584EE),
      Icons.school_rounded,
    ),
    (
      'Bí kíp tăng điểm tiếng Anh THPT',
      Color(0xFF3D86F0),
      Icons.ondemand_video_rounded,
    ),
    (
      'Chuyên đề các dạng ngữ pháp chuyên tiếp đại học',
      Color(0xFF315CE7),
      Icons.flight_takeoff_rounded,
    ),
    (
      'Gói mở rộng tiếng Anh thiếu nhi L1-6',
      Color(0xFF5945E3),
      Icons.menu_book_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            AppRoutes.courseDiscovery,
                          ),
                          child: Text(
                            'Trực tuyến',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: const Color(0xFFA0AAB8)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Của tôi',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 3),
                          Container(
                            width: 46,
                            height: 2,
                            color: const Color(0xFF1F2937),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                TextButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.courseDiscovery),
                  icon: const Icon(Icons.swap_horiz_rounded, size: 15),
                  label: const Text('Thiếu nhi', style: TextStyle(fontSize: 9)),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF485365),
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 5,
                    ),
                    side: const BorderSide(color: Color(0xFFE1E6EC)),
                    shape: const StadiumBorder(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: [
                for (final (index, filter) in _filters.indexed)
                  InkWell(
                    onTap: () => setState(() => _selectedFilter = index),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 14, top: 8),
                      child: Column(
                        children: [
                          Text(
                            filter,
                            style: TextStyle(
                              fontSize: 12,
                              color: _selectedFilter == index
                                  ? const Color(0xFF1F2937)
                                  : const Color(0xFF8792A2),
                              fontWeight: _selectedFilter == index
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 5),
                          if (_selectedFilter == index)
                            Container(
                              width: 34,
                              height: 2,
                              color: const Color(0xFF2861EF),
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 14),
              itemCount: _selectedFilter == 1 ? 3 : _courses.length,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final course = _courses[index];
                return CourseSurfaceCard(
                  child: InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.courseCategory),
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox(
                      height: 88,
                      child: Row(
                        children: [
                          Container(
                            width: 84,
                            height: 68,
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: course.$2,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Icon(
                              course.$3,
                              size: 34,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                course.$1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2,
                                ),
                              ),
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
        ],
      ),
    );
  }
}
