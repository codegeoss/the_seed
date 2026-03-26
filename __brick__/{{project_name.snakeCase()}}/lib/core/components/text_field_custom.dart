import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    required this.hintText,
    this.prefix,
    this.suffix,
    super.key,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.textColor,
    this.maxLength,
    this.maxLines,
    this.controller,
    this.onChanged,
    this.showTitle = true,
    this.onTap,
    this.enabled = false,
    this.validator,
    this.inputFormatters,
    this.autoValidateMode,
    this.fillColor,
    this.hintColor,
    this.borderColor = AppColors.secondary,
    this.height,
    this.textCapitalization = TextCapitalization.none,
  });

  final String? hintText;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final int? maxLines;
  final Color? textColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final bool showTitle;
  final VoidCallback? onTap;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final Color? fillColor;
  final Color? hintColor;
  final Color? borderColor;
  final double? height;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle) ...[
          Text(
            hintText ?? '',
            style: TextStyle(
              fontSize: AppSizes.fontSizeSm,
              color: hintColor ?? (isDarkMode ? Colors.white : Colors.black),
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
        ],
        SizedBox(
          height: height,
          child: TextFormField(
            keyboardAppearance: isDarkMode ? Brightness.dark : Brightness.light,
            textCapitalization: textCapitalization!,
            autovalidateMode: autoValidateMode,
            onTap: onTap,
            readOnly: enabled!,
            maxLines: maxLines ?? 1,
            controller: controller,
            style: TextStyle(
              color: textColor ?? (isDarkMode ? Colors.white : Colors.black),
              fontSize: AppSizes.fontSizeSm,
            ),
            textInputAction: textInputAction,
            keyboardType: textInputType,
            cursorColor:
                textColor ?? (isDarkMode ? Colors.white : Colors.black),
            obscureText: obscureText,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor:
                  fillColor ?? (isDarkMode ? Colors.black : Colors.white),
              hintStyle: TextStyle(
                color: hintColor ?? (isDarkMode ? Colors.white : Colors.black),
                fontSize: AppSizes.fontSizeMd,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                borderSide: BorderSide(color: borderColor!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                borderSide: BorderSide(color: borderColor!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                borderSide: BorderSide(color: borderColor!),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                borderSide: const BorderSide(color: Colors.redAccent),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
                borderSide: const BorderSide(color: Colors.redAccent),
              ),
              prefixIcon: prefix,
              suffixIcon: suffix,
            ),
            onChanged: onChanged,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
