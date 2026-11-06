import 'package:flutter/material.dart';

import '../../../app/app.dart';
import '../../../core/theme/app_colors.dart';
import '../../../features/learning/models/learning_stage.dart';
import '../../../shared/widgets/figma_asset_icon.dart';
import '../../../shared/widgets/screen_header.dart';
import '../../../shared/widgets/web_design_frame.dart';

const _stages = [
  LearningStage(
    title: 'Học từ vựng',
    progress: 0,
    total: 45,
    iconAsset: 'assets/icons/progress.svg',
    route: AppRoutes.vocabularyReview,
  ),
  LearningStage(
    title: 'Học chính tả',
    progress: 0,
    total: 30,
    iconAsset: 'assets/icons/pencil.svg',
    route: AppRoutes.vocabularyImage,
  ),
  LearningStage(
    title: 'Luyện nói',
    progress: 0,
    total: 15,
    iconAsset: 'assets/icons/microphone.svg',
    route: AppRoutes.vocabularyImage,
  ),
  LearningStage(
    title: 'Đọc sách tranh',
    progress: 0,
    total: 6,
    iconAsset: 'assets/icons/storybook.svg',
    route: AppRoutes.pictureStory,
    isLocked: true,
  ),
];

class LearningPathScreen extends StatelessWidget {
  const LearningPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WebDesignFrame(
      designSize: const Size(800, 360),
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
            final compact = constraints.maxWidth < 720;
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 840),
                child: Padding(
                  padding: EdgeInsets.all(compact ? 18 : 20),
                  child: Column(
                    children: [
                      ScreenHeader(
                        title: 'Day 1',
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              tooltip: 'Khám phá khóa học',
                              onPressed: () => Navigator.pushNamed(
                                context,
                                AppRoutes.courseDiscovery,
                              ),
                              icon: const Icon(Icons.school_outlined, size: 19),
                              visualDensity: VisualDensity.compact,
                            ),
                            const SizedBox(width: 4),
                            const _StarCounter(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (!compact)
                              Positioned.fill(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 35,
                                  ),
                                  child: SvgPicturePath(),
                                ),
                              ),
                            if (compact)
                              _CompactStageGrid(stages: _stages)
                            else
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  for (
                                    var index = 0;
                                    index < _stages.length;
                                    index++
                                  )
                                    _StageItem(
                                      stage: _stages[index],
                                      offset: index.isEven ? 12 : -12,
                                    ),
                                ],
                              ),
                          ],
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
      ),
    );
  }
}

class SvgPicturePath extends StatelessWidget {
  const SvgPicturePath({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaAssetIcon(
      'assets/illustrations/learning_path.svg',
      size: double.infinity,
    );
  }
}

class _CompactStageGrid extends StatelessWidget {
  const _CompactStageGrid({required this.stages});

  final List<LearningStage> stages;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: stages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
        childAspectRatio: 1.08,
      ),
      itemBuilder: (context, index) =>
          _StageItem(stage: stages[index], compact: true),
    );
  }
}

class _StageItem extends StatelessWidget {
  const _StageItem({
    required this.stage,
    this.offset = 0,
    this.compact = false,
  });

  final LearningStage stage;
  final double offset;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final size = compact ? 76.0 : 96.0;
    return Transform.translate(
      offset: Offset(0, compact ? 0 : offset),
      child: Semantics(
        button: !stage.isLocked,
        label: stage.title,
        child: InkWell(
          borderRadius: BorderRadius.circular(size),
          onTap: stage.isLocked
              ? null
              : () => Navigator.pushNamed(context, stage.route),
          child: SizedBox(
            width: compact ? double.infinity : 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: stage.isLocked
                          ? const Color(0xFFF3F6F9)
                          : const Color(0xFFA2E2FC),
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.emphasis.withValues(alpha: 0.12),
                        blurRadius: 16,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                  child: Center(
                    child: stage.title == 'Học từ vựng'
                        ? Container(
                            width: 56,
                            height: 64,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Aa',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(color: AppColors.surface),
                            ),
                          )
                        : FigmaAssetIcon(stage.iconAsset, size: 40),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  stage.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  '${stage.progress}/${stage.total}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: stage.isLocked
                        ? AppColors.secondaryText
                        : AppColors.emphasis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StarCounter extends StatelessWidget {
  const _StarCounter();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFEFF6FF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const FigmaAssetIcon('assets/icons/star.svg', size: 20),
          const SizedBox(width: 6),
          Text('0', style: Theme.of(context).textTheme.bodyMedium),
          Text(
            '/96',
            style: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(color: const Color(0xFFA5C5DC)),
          ),
        ],
      ),
    );
  }
}
