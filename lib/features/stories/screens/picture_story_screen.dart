import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/screen_header.dart';

class PictureStoryScreen extends StatefulWidget {
  const PictureStoryScreen({super.key});

  @override
  State<PictureStoryScreen> createState() => _PictureStoryScreenState();
}

class _PictureStoryScreenState extends State<PictureStoryScreen> {
  var _page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const ScreenHeader(title: 'Đọc sách tranh', showBack: true),
                  const SizedBox(height: 20),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final compact = constraints.maxWidth < 600;
                        final illustration = _StoryIllustration(page: _page);
                        final story = _StoryText(page: _page);
                        return compact
                            ? Column(
                                children: [
                                  Expanded(flex: 5, child: illustration),
                                  const SizedBox(height: 16),
                                  Expanded(flex: 4, child: story),
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(flex: 4, child: illustration),
                                  const SizedBox(width: 26),
                                  Expanded(flex: 6, child: story),
                                ],
                              );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        tooltip: 'Trang trước',
                        onPressed: _page == 1
                            ? null
                            : () => setState(() => _page = 1),
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      Text('$_page / 2'),
                      IconButton(
                        tooltip: 'Trang sau',
                        onPressed: _page == 2
                            ? null
                            : () => setState(() => _page = 2),
                        icon: const Icon(Icons.arrow_forward_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StoryIllustration extends StatelessWidget {
  const _StoryIllustration({required this.page});

  final int page;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 260),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26387DB9),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              page == 1 ? Icons.pets_rounded : Icons.park_rounded,
              size: 62,
              color: AppColors.emphasis,
            ),
            const SizedBox(height: 8),
            Text('Anna & Max', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

class _StoryText extends StatelessWidget {
  const _StoryText({required this.page});

  final int page;

  @override
  Widget build(BuildContext context) {
    final sentence = page == 1
        ? 'My name is Anna. I have a little dog. His name is Max.'
        : 'Max likes to play under the tree.';
    final translation = page == 1
        ? 'Tên tôi là Anna. Tôi có một chú chó nhỏ. Tên nó là Max.'
        : 'Max thích chơi dưới gốc cây.';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sentence, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 20),
        Text(
          translation,
          style: Theme.of(context).textTheme.bodyLarge
              ?.copyWith(color: AppColors.secondaryText),
        ),
        const SizedBox(height: 18),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.volume_up_rounded),
          label: const Text('Nghe phát âm'),
        ),
      ],
    );
  }
}
