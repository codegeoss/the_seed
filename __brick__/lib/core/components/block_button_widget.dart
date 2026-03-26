import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget({
    required this.child,
    this.onPressed,
    this.color = AppColors.primary,
    super.key,
    this.borderColor = Colors.transparent,
  });

  final Color? color;

  final Color? borderColor;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      height: 52,
      disabledElevation: 0,
      disabledColor: isDarkMode
          ? AppColors.darkContainer
          : AppColors.lightContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: borderColor!),
      ),
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      minWidth: double.infinity,
      child: child,
    );
  }
}
