import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/figma_asset_icon.dart';

class VocabularyImageScreen extends StatelessWidget {
  const VocabularyImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 620;
            return Padding(
              padding: EdgeInsets.all(compact ? 16 : 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        tooltip: 'Quay lại',
                        onPressed: () => Navigator.maybePop(context),
                        icon: const FigmaAssetIcon(
                          'assets/icons/back.svg',
                          size: 20,
                        ),
                      ),
                      const Expanded(child: _ProgressTrack()),
                      const SizedBox(width: 12),
                      const _ScorePill(),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton.filled(
                            tooltip: 'Nghe phát âm',
                            onPressed: null,
                            icon: const FigmaAssetIcon(
                              'assets/icons/listen.svg',
                              size: 24,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: compact ? 240 : 320,
                            height: compact ? 190 : 220,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFF7DD3FC),
                                width: 3,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x26387DB9),
                                  blurRadius: 20,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              'assets/images/vocabulary/dog_flower.png',
                              fit: BoxFit.cover,
                              alignment: const Alignment(0, -0.2),
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                    child: Text('Không tải được hình minh họa'),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Tooltip(
                      message: 'Tiếp tục',
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          AppRoutes.vocabularyImageChoice,
                        ),
                        child: const FigmaAssetIcon(
                          'assets/icons/next.svg',
                          size: 26,
                          color: AppColors.surface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ProgressTrack extends StatelessWidget {
  const _ProgressTrack();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: const LinearProgressIndicator(
        value: 0.25,
        minHeight: 8,
        backgroundColor: AppColors.softBackground,
        color: AppColors.primary,
      ),
    );
  }
}

class _ScorePill extends StatelessWidget {
  const _ScorePill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.softBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FigmaAssetIcon('assets/icons/star.svg'),
          SizedBox(width: 5),
          Text('0'),
        ],
      ),
    );
  }
}
