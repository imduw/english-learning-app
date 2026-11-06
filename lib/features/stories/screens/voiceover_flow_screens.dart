import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../courses/widgets/mobile_learning_shell.dart';
import 'storybook_experience_screens.dart';

class VoiceoverStartScreen extends StatelessWidget {
  const VoiceoverStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _VoiceoverFrame(
      child: Row(
        children: [
          const StoryBookCover(width: 235, height: 258),
          const SizedBox(width: 42),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SentenceLine(
                  text: 'Max is small and cute. He has brown fur and big eyes.',
                  fontSize: 14,
                ),
                const SizedBox(height: 28),
                Center(
                  child: IconButton.filled(
                    tooltip: 'Bắt đầu lồng tiếng',
                    onPressed: () => Navigator.pushNamed(
                      context,
                      AppRoutes.voiceoverRecording,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7900),
                      foregroundColor: Colors.white,
                      fixedSize: const Size(64, 64),
                      elevation: 3,
                    ),
                    icon: const Icon(Icons.play_arrow_rounded, size: 38),
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

class VoiceoverRecordingScreen extends StatefulWidget {
  const VoiceoverRecordingScreen({super.key});

  @override
  State<VoiceoverRecordingScreen> createState() =>
      _VoiceoverRecordingScreenState();
}

class _VoiceoverRecordingScreenState extends State<VoiceoverRecordingScreen> {
  var _recording = false;

  @override
  Widget build(BuildContext context) {
    return _VoiceoverFrame(
      child: Row(
        children: [
          const StoryBookCover(width: 235, height: 258),
          const SizedBox(width: 42),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SentenceLine(
                  text: 'Max is small and cute. He has brown fur and big eyes.',
                  fontSize: 14,
                ),
                const SizedBox(height: 26),
                Center(
                  child: Column(
                    children: [
                      IconButton.filled(
                        tooltip: _recording ? 'Dừng ghi âm' : 'Bắt đầu ghi âm',
                        onPressed: () {
                          if (_recording) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.voiceoverResult,
                            );
                          } else {
                            setState(() => _recording = true);
                          }
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: const Color(0xFFFF7900),
                          foregroundColor: Colors.white,
                          fixedSize: const Size(72, 72),
                          elevation: 3,
                        ),
                        icon: Icon(
                          _recording
                              ? Icons.stop_rounded
                              : Icons.graphic_eq_rounded,
                          size: 34,
                        ),
                      ),
                      if (_recording) ...[
                        const SizedBox(height: 8),
                        const Text(
                          'Đang ghi âm',
                          style: TextStyle(
                            color: Color(0xFFFF7900),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ],
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

class VoiceoverResultScreen extends StatelessWidget {
  const VoiceoverResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _VoiceoverFrame(
      child: Row(
        children: [
          const StoryBookCover(width: 235, height: 258),
          const SizedBox(width: 42),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SentenceLine(
                  text: 'Max is small and cute. He has brown fur and big eyes.',
                  color: Color(0xFF2DCC78),
                  fontSize: 14,
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.lightbulb_outline_rounded, color: Color(0xFFFF7900), size: 17),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Max nhỏ nhắn và dễ thương. Nó có bộ lông màu nâu và đôi mắt to.',
                        style: TextStyle(fontSize: 12, color: Color(0xFF6D7480)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Center(child: _ThreeStars()),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton.filled(
                    tooltip: 'Xem kết quả hoàn thành',
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.voiceoverComplete,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7900),
                      foregroundColor: Colors.white,
                      fixedSize: const Size(56, 56),
                    ),
                    icon: const Icon(Icons.chevron_right_rounded, size: 30),
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

class VoiceoverCompleteScreen extends StatelessWidget {
  const VoiceoverCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      webFrameSize: const Size(800, 360),
      showStatusBar: false,
      showBottomNavigation: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 22),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.workspace_premium_rounded, size: 92, color: Color(0xFFFFBB28)),
                  SizedBox(height: 4),
                  Text('Chúc mừng!', style: TextStyle(color: Color(0xFF7747EA), fontSize: 14, fontWeight: FontWeight.w700)),
                  SizedBox(height: 4),
                  Text('Bạn đã hoàn thành bài lồng tiếng!', textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: Color(0xFF455064))),
                ],
              ),
            ),
            const SizedBox(width: 38),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: const LinearProgressIndicator(
                            value: 1,
                            minHeight: 16,
                            backgroundColor: Color(0xFFE8EBCB),
                            color: Color(0xFF8DD525),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.star_rounded, color: Color(0xFF8DD525), size: 26),
                    ],
                  ),
                  const SizedBox(height: 38),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: FilledButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.childLearningPath,
                        (route) => route.isFirst,
                      ),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF04A8EF),
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text('Quay lại'),
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

class _VoiceoverFrame extends StatelessWidget {
  const _VoiceoverFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MobileLearningShell(
      webFrameSize: const Size(800, 360),
      showStatusBar: false,
      showBottomNavigation: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 8, 24, 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                tooltip: 'Quay lại',
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFFFF7900)),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _SentenceLine extends StatelessWidget {
  const _SentenceLine({
    required this.text,
    this.color = const Color(0xFF333333),
    this.fontSize = 14,
  });

  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.volume_up_rounded, color: Color(0xFFFF7900), size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700, color: color, height: 1.25),
          ),
        ),
      ],
    );
  }
}

class _ThreeStars extends StatelessWidget {
  const _ThreeStars();

  @override
  Widget build(BuildContext context) => const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star_rounded, color: Color(0xFFFFB31A), size: 38),
          SizedBox(width: 8),
          Icon(Icons.star_rounded, color: Color(0xFFFFB31A), size: 48),
          SizedBox(width: 8),
          Icon(Icons.star_rounded, color: Color(0xFFFFB31A), size: 38),
        ],
      );
}
