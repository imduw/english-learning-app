import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/screen_header.dart';
import '../data/sample_vocabulary.dart';
import '../models/vocabulary_word.dart';

class VocabularyReviewScreen extends StatefulWidget {
  const VocabularyReviewScreen({super.key});

  @override
  State<VocabularyReviewScreen> createState() => _VocabularyReviewScreenState();
}

class _VocabularyReviewScreenState extends State<VocabularyReviewScreen> {
  late final List<VocabularyWord> _words = sampleVocabulary.toList();

  void _toggleWord(int index) {
    setState(() {
      _words[index] = _words[index].copyWith(
        isSelected: !_words[index].isSelected,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScreenHeader(title: 'Từ vựng hôm nay:', showBack: true),
                  const SizedBox(height: 4),
                  Text(
                    'Đối với những từ đã nắm vững, bạn có thể bỏ tích chọn nhé ~',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final columns = constraints.maxWidth < 520 ? 1 : 2;
                        return GridView.builder(
                          itemCount: _words.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: columns,
                                mainAxisExtent: 58,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 20,
                              ),
                          itemBuilder: (context, index) => _VocabularyTile(
                            item: _words[index],
                            onTap: () => _toggleWord(index),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Tooltip(
                      message: 'Tiếp tục',
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          AppRoutes.vocabularyImage,
                        ),
                        child: const Icon(Icons.arrow_forward_rounded),
                      ),
                    ),
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

class _VocabularyTile extends StatelessWidget {
  const _VocabularyTile({required this.item, required this.onTap});

  final VocabularyWord item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final selected = item.isSelected && !item.isMastered;
    return Semantics(
      button: true,
      checked: item.isSelected,
      label: item.word,
      child: Material(
        color: selected ? const Color(0xFFE2F3FE) : AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: selected ? AppColors.border : const Color(0xFFE2E5E8),
              ),
              boxShadow: [
                BoxShadow(
                  color: (selected ? AppColors.primary : Colors.black)
                      .withValues(alpha: 0.12),
                  offset: const Offset(0, 3),
                  blurRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.word,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: item.isMastered
                          ? const Color(0xFF868F97)
                          : const Color(0xFF444D56),
                      decoration: item.isMastered
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ),
                if (item.isMastered)
                  const Text('Đã thuộc rồi')
                else
                  Icon(
                    item.isSelected ? Icons.check_rounded : Icons.add_rounded,
                    color: AppColors.surface,
                    size: 17,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
