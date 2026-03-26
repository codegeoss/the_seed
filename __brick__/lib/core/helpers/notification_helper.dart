import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

abstract class NotificationHelper {
  static void showToast(
    BuildContext context, {
    required String message,
    ToastificationType type = ToastificationType.error,
  }) {
    toastification.show(
      context: context,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 3),
      type: type,
      backgroundColor: Colors.white,
      alignment: Alignment.bottomCenter,
      closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
      showProgressBar: true,
      dragToClose: true,
      closeOnClick: true,
      title: Text(
        message,
        style: const TextStyle(
          fontSize: AppSizes.fontSizeSm,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
