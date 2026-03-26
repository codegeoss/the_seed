import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

class CustomRadioWidget<T> extends StatelessWidget {
  const CustomRadioWidget({
    required this.value,
    required this.onChanged,
    required this.groupValue,
    super.key,
    this.secondary,
    this.title,
    this.subtitle,
    this.controlAffinity = ListTileControlAffinity.trailing,
    this.borderColor,
  });
  final Widget? title;
  final Widget? subtitle;
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final Widget? secondary;
  final ListTileControlAffinity? controlAffinity;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<T>(
      groupValue: groupValue,
      onChanged: onChanged,
      child: RadioListTile<T>(
        title: title,
        subtitle: subtitle,
        value: value,
        activeColor: AppColors.primary,
        contentPadding: EdgeInsets.zero,
        secondary: secondary,
        controlAffinity: controlAffinity,
        shape: Border(
          bottom: BorderSide(color: borderColor ?? Colors.grey.shade200),
        ),
      ),
    );
  }
}
