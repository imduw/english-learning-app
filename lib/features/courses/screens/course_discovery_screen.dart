import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../widgets/mobile_learning_shell.dart';

class CourseDiscoveryScreen extends StatelessWidget {
  const CourseDiscoveryScreen({super.key});

  static const _categories = [
    (Icons.confirmation_number_outlined, 'TOEIC'),
    (Icons.school_outlined, 'Đại học'),
    (Icons.flight_takeoff_outlined, 'Du học'),
    (Icons.coffee_outlined, 'Thực tế'),
    (Icons.grid_view_rounded, '4 KỸ N'),
    (Icons.insights_rounded, 'Lý lịch'),
    (Icons.co_present_outlined, 'Ngữ pháp'),
    (Icons.calendar_month_outlined, '1 câu/ngày'),
    (Icons.menu_book_outlined, 'IELTS'),
    (Icons.import_contacts_outlined, 'Giảng đường'),
    (Icons.travel_explore_outlined, 'Nâng cao'),
    (Icons.auto_stories_outlined, 'Tiểu thuyết'),
  ];

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Trực tuyến',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.myCourses),
                          child: Text(
                            'Của tôi',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: const Color(0xFF9AA4B2)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                TextButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.childLearningPath),
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
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(4, 12, 4, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFF0F2F5)),
                  ),
                  child: Wrap(
                    runSpacing: 12,
                    children: [
                      for (final (index, item) in _categories.indexed)
                        SizedBox(
                          width:
                              (MediaQuery.sizeOf(context).width
                                      .clamp(320, 436) -
                                  48) /
                              5,
                          child: InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.courseCategory,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  item.$1,
                                  size: 23,
                                  color: const Color(0xFF202B3A),
                                ),
                                const SizedBox(height: 7),
                                Text(
                                  item.$2,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 9,
                                    color: Color(0xFF596579),
                                  ),
                                ),
                                if (index == 0) const SizedBox(height: 2),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Đột phá tiếng Anh chuyên đề',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 142,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (_, _) => const SizedBox(width: 8),
                    itemBuilder: (context, index) =>
                        _SpecialCourseCard(index: index),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Chủ đề đặc biệt',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 9),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.courseCategory),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 205,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF46566C),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 64,
                              height: 92,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE898),
                                borderRadius: BorderRadius.circular(9),
                              ),
                              child: const Icon(
                                Icons.auto_stories_rounded,
                                size: 36,
                                color: Color(0xFFB36B25),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tiếng anh thực tế  ›',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '🌐🌐🌐  2.8 nghìn người đang học',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              children: [
                                Expanded(child: _MiniCourseTile()),
                                SizedBox(width: 8),
                                Expanded(child: _MiniCourseTile()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecialCourseCard extends StatelessWidget {
  const _SpecialCourseCard({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, AppRoutes.courseCategory),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE8EDF3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF35B5F5), Color(0xFF5791EE)],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(
                        Icons.cast_for_education_rounded,
                        color: Color(0xFFFFDD4B),
                        size: 45,
                      ),
                      Positioned(
                        top: 5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2,
                          ),
                          decoration: const ShapeDecoration(
                            color: Color(0xFF2861EF),
                            shape: StadiumBorder(),
                          ),
                          child: const Text(
                            'ez for exam',
                            style: TextStyle(color: Colors.white, fontSize: 7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                index == 0 ? 'Bí kíp 800' : 'Bí kíp 800',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniCourseTile extends StatelessWidget {
  const _MiniCourseTile();

  @override
  Widget build(BuildContext context) => const Row(
    children: [
      Icon(Icons.menu_book_rounded, size: 26, color: Color(0xFF3977E7)),
      SizedBox(width: 5),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '0 - 450',
              style: TextStyle(fontSize: 8, color: Color(0xFF3977E7)),
            ),
            SizedBox(height: 3),
            Text(
              'Nghe trải nghiệm',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700),
            ),
            Text(
              'Mọi người đều',
              style: TextStyle(fontSize: 8, color: Color(0xFF9AA4B2)),
            ),
          ],
        ),
      ),
    ],
  );
}
