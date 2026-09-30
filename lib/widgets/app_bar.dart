import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final bool showBackButton;
  final bool showMenuButton;
  final List<Widget>? actions;
  final bool centerTitle;
  final VoidCallback? onBackPressed;
  final VoidCallback? onMenuPressed;

  const AppAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.showMenuButton = false,
    this.actions,
    this.centerTitle = false,
    this.onBackPressed,
    this.onMenuPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Widget? leading;

    if (showBackButton) {
      leading = IconButton(
        tooltip: 'Volver',
        onPressed: onBackPressed ?? () => Navigator.of(context).maybePop(),
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.primaryText,
          size: 22,
        ),
      );
    } else if (showMenuButton) {
      leading = IconButton(
        tooltip: 'Menú',
        onPressed: onMenuPressed ?? () {},
        icon: const Icon(Icons.menu, color: AppColors.primaryText, size: 22),
      );
    }

    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: leading,
      titleSpacing: leading != null ? 0 : 16,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryText,
        ),
      ),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: Colors.black.withValues(alpha: 0.06),
          height: 1,
        ),
      ),
    );
  }
}
