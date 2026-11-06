import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'figma_asset_icon.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({
    required this.title,
    this.showBack = false,
    this.trailing,
    super.key,
  });

  final String title;
  final bool showBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showBack) ...[
          IconButton(
            tooltip: 'Quay lại',
            onPressed: () => Navigator.maybePop(context),
            icon: const FigmaAssetIcon('assets/icons/back.svg', size: 20),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.softBackground,
              fixedSize: const Size(40, 40),
            ),
          ),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        ?trailing,
      ],
    );
  }
}
