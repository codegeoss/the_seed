import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/core.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    super.key,
    Widget? title,
    super.onSaved,
    super.validator,
    bool super.initialValue = false,
  }) : super(
         builder: (state) {
           return CheckboxListTile(
             contentPadding: EdgeInsets.zero,
             checkboxShape: const CircleBorder(),
             side: BorderSide(color: Colors.grey.shade300),
             activeColor: AppColors.primary,
             dense: state.hasError,
             title: title,
             value: state.value,
             onChanged: state.didChange,
             subtitle: state.hasError
                 ? Builder(
                     builder: (context) => Text(
                       state.errorText ?? '',
                       style: TextStyle(
                         color: Theme.of(context).colorScheme.error,
                       ),
                     ),
                   )
                 : null,
             controlAffinity: ListTileControlAffinity.leading,
           );
         },
       );
}
