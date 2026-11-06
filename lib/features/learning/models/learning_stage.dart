class LearningStage {
  const LearningStage({
    required this.title,
    required this.progress,
    required this.total,
    required this.iconAsset,
    required this.route,
    this.isLocked = false,
  });

  final String title;
  final int progress;
  final int total;
  final String iconAsset;
  final String route;
  final bool isLocked;
}
