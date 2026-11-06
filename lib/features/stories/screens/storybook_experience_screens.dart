import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../courses/widgets/mobile_learning_shell.dart';

class StoryModeScreen extends StatelessWidget {
  const StoryModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      webFrameSize: const Size(800, 360),
      showStatusBar: false,
      showBottomNavigation: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 10, 28, 18),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                tooltip: 'Quay lại',
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFFFF7900),
                  size: 19,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const StoryBookCover(width: 235, height: 258),
                  const SizedBox(width: 40),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.volume_up_rounded,
                              color: Color(0xFFFF7900),
                              size: 24,
                            ),
                            SizedBox(width: 14),
                            Text(
                              'My little dog',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF414141),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 34),
                        Wrap(
                          spacing: 18,
                          runSpacing: 12,
                          children: [
                            _ModeButton(
                              label: 'Đọc',
                              icon: Icons.menu_book_rounded,
                              color: const Color(0xFFFF7900),
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.storyPage1,
                              ),
                            ),
                            _ModeButton(
                              label: 'Lồng tiếng',
                              icon: Icons.mic_none_rounded,
                              color: const Color(0xFF9D63F5),
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.voiceoverStart,
                              ),
                            ),
                          ],
                        ),
                      ],
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

class StoryBookPageScreen extends StatelessWidget {
  const StoryBookPageScreen({required this.page, super.key});

  final int page;

  @override
  Widget build(BuildContext context) {
    final isFirst = page == 1;
    final sentence = isFirst
        ? 'My name is Anna. I have a little dog. His name is Max.'
        : 'Max is small and cute. He has brown fur and big eyes.';
    final translation = isFirst
        ? 'Tên tôi là Anna. Tôi có một chú chó nhỏ. Tên nó là Max.'
        : 'Max nhỏ nhắn và dễ thương. Nó có bộ lông màu nâu và đôi mắt to.';
    return MobileLearningShell(
      webFrameSize: const Size(800, 360),
      showStatusBar: false,
      showBottomNavigation: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(26, 8, 24, 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                tooltip: 'Quay lại',
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFFFF7900),
                  size: 19,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const StoryBookCover(width: 235, height: 258),
                  const SizedBox(width: 42),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              tooltip: 'Nghe câu tiếng Anh (chưa có audio)',
                              onPressed: () => _showAudioNotice(context),
                              visualDensity: VisualDensity.compact,
                              icon: const Icon(
                                Icons.volume_up_rounded,
                                color: Color(0xFFFF7900),
                                size: 20,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                sentence,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 1.25,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.lightbulb_outline_rounded,
                              color: Color(0xFFFF7900),
                              size: 19,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                translation,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF687386),
                                  height: 1.25,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 34),
                        Row(
                          children: [
                            IconButton.filled(
                              tooltip: 'Trang trước',
                              onPressed: isFirst
                                  ? null
                                  : () => Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes.storyPage1,
                                    ),
                              style: IconButton.styleFrom(
                                backgroundColor: const Color(0xFF9EA8B5),
                                foregroundColor: Colors.white,
                              ),
                              icon: const Icon(Icons.chevron_left_rounded),
                            ),
                            Text(
                              '$page / 2',
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF75839A),
                              ),
                            ),
                            const Spacer(),
                            IconButton.filled(
                              tooltip: isFirst ? 'Trang sau' : 'Hoàn thành đọc',
                              onPressed: () => Navigator.pushReplacementNamed(
                                context,
                                isFirst
                                    ? AppRoutes.storyPage2
                                    : AppRoutes.storyReadComplete,
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: const Color(0xFFFF7900),
                                foregroundColor: Colors.white,
                              ),
                              icon: Icon(
                                isFirst
                                    ? Icons.chevron_right_rounded
                                    : Icons.check_rounded,
                              ),
                            ),
                          ],
                        ),
                      ],
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

class StoryReadingCompleteScreen extends StatelessWidget {
  const StoryReadingCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      webFrameSize: const Size(800, 360),
      showStatusBar: false,
      showBottomNavigation: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                tooltip: 'Quay lại',
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFFFF7900),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _CompletionActivity(
                        icon: Icons.library_books_rounded,
                        label: 'Đọc truyện tranh',
                        completed: true,
                      ),
                      _CompletionActivity(
                        icon: Icons.record_voice_over_rounded,
                        label: 'Thử thách lồng tiếng',
                        completed: false,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 12,
                    ),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFF8EF),
                      border: Border.symmetric(
                        horizontal: BorderSide(color: Color(0xFFFFC58C)),
                      ),
                    ),
                    child: const Text(
                      'Tuyệt vời quá! Đây là cuốn truyện tranh thứ 1 bé đã đọc trên Cake English~',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: 290,
                    height: 42,
                    child: FilledButton.icon(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        AppRoutes.voiceoverStart,
                      ),
                      icon: const Icon(Icons.mic_rounded, size: 17),
                      label: const Text(
                        'Lồng tiếng',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF9D63F5),
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                      ),
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

class _CompletionActivity extends StatelessWidget {
  const _CompletionActivity({
    required this.icon,
    required this.label,
    required this.completed,
  });

  final IconData icon;
  final String label;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              icon,
              size: 46,
              color: completed
                  ? const Color(0xFF45BFEF)
                  : const Color(0xFFADB7C4),
            ),
            if (completed)
              const Positioned(
                right: -7,
                top: -7,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Color(0xFF75B90F),
                  child: Icon(
                    Icons.check_rounded,
                    size: 13,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: completed
                ? const Color(0xFF5C6878)
                : const Color(0xFFA8B0BD),
          ),
        ),
      ],
    );
  }
}

class StoryBookCover extends StatelessWidget {
  const StoryBookCover({required this.width, required this.height, super.key});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFF7900),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: Color(0x332D1D0D),
            blurRadius: 12,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/vocabulary/dog_flower.png',
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.15),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  const _ModeButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145,
      height: 58,
      child: FilledButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 20),
        label: Text(label, style: const TextStyle(fontSize: 18)),
        style: FilledButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          elevation: 3,
        ),
      ),
    );
  }
}

void _showAudioNotice(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Chưa có tệp audio cho câu chuyện này.')),
  );
}
