import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/web_design_frame.dart';

enum LearningTab { vocabulary, learning, community, rewards, profile }

class MobileLearningShell extends StatelessWidget {
  const MobileLearningShell({
    required this.child,
    this.selectedTab = LearningTab.learning,
    this.showBottomNavigation = true,
    this.showStatusBar = true,
    this.webFrameSize = const Size(436, 876),
    super.key,
  });

  final Widget child;
  final LearningTab selectedTab;
  final bool showBottomNavigation;
  final bool showStatusBar;
  final Size webFrameSize;

  static const _items = [
    (LearningTab.vocabulary, Icons.font_download_outlined, 'Từ vựng'),
    (LearningTab.learning, Icons.video_library_outlined, 'Học tập'),
    (LearningTab.community, Icons.language_rounded, 'Cùng học'),
    (LearningTab.rewards, Icons.wallet_outlined, 'Đổi xu'),
    (LearningTab.profile, Icons.person_outline_rounded, 'Cá nhân'),
  ];

  @override
  Widget build(BuildContext context) {
    return WebDesignFrame(
      designSize: webFrameSize,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F8FA),
        body: SafeArea(
          child: Column(
            children: [
              if (kIsWeb && showStatusBar) const _StatusBar(),
              Expanded(child: child),
              if (showBottomNavigation)
                _BottomNavigation(selectedTab: selectedTab),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  const _StatusBar();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 24,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Text('18:17', style: TextStyle(fontSize: 12)),
            Spacer(),
            Icon(Icons.signal_cellular_alt_rounded, size: 12),
            SizedBox(width: 5),
            Icon(Icons.wifi_rounded, size: 13),
            SizedBox(width: 5),
            Icon(Icons.battery_6_bar_rounded, size: 15),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({required this.selectedTab});

  final LearningTab selectedTab;

  void _openTab(BuildContext context, LearningTab tab) {
    final route = switch (tab) {
      LearningTab.learning => '/learning/path',
      LearningTab.vocabulary => '/vocabulary/review',
      LearningTab.community => '/',
      LearningTab.rewards => '/courses/mine',
      LearningTab.profile => '/courses/mine',
    };
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFE9EDF2))),
      ),
      child: Row(
        children: [
          for (final item in MobileLearningShell._items)
            Expanded(
              child: InkWell(
                onTap: () => _openTab(context, item.$1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.$2,
                      size: 19,
                      color: item.$1 == selectedTab
                          ? const Color(0xFF1F2937)
                          : const Color(0xFF9AA4B2),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.$3,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 10,
                        color: item.$1 == selectedTab
                            ? const Color(0xFF273244)
                            : const Color(0xFF8A96A6),
                        fontWeight: item.$1 == selectedTab
                            ? FontWeight.w700
                            : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CourseScreenBackButton extends StatelessWidget {
  const CourseScreenBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Quay lại',
      onPressed: () => Navigator.maybePop(context),
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints.tightFor(width: 34, height: 34),
      icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 17),
    );
  }
}

class CoursePillButton extends StatelessWidget {
  const CoursePillButton({
    required this.label,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF2861EF),
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const StadiumBorder(),
          textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        child: Text(label),
      ),
    );
  }
}

class CourseSurfaceCard extends StatelessWidget {
  const CourseSurfaceCard({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEDF0F4)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x080E2033),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
