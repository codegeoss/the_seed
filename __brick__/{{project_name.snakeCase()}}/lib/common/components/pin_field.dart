import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

class PinField extends StatelessWidget {
  const PinField({
    required TextEditingController otpController,
    super.key,
    this.onCompleted,
    this.validator,
  }) : controller = otpController;

  final TextEditingController controller;
  final ValueChanged<String>? onCompleted;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    final defaultPinTheme = PinTheme(
      padding: const EdgeInsets.only(right: 20),
      width: 48,
      height: 56,
      textStyle: const TextStyle(fontSize: AppSizes.fontSizeSm),
      decoration: BoxDecoration(
        color: isDarkMode
            ? AppColors.secondary.withValues(alpha: 0.2)
            : AppColors.secondary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(AppSizes.cardRadiusSm),
      ),
    );
    return Pinput(
      length: 6,
      controller: controller,
      onCompleted: onCompleted,
      validator: validator,
      pinContentAlignment: Alignment.centerRight,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      defaultPinTheme: defaultPinTheme,
      submittedPinTheme: defaultPinTheme,
      followingPinTheme: defaultPinTheme,
      disabledPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme,
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.red.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      errorTextStyle: const TextStyle(color: Colors.redAccent),
    );
  }
}
