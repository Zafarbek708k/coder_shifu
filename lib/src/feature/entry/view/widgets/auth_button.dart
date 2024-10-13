import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/text_widget.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.title, this.onPressed});
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: context.appTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
            color: Colors.deepPurpleAccent
        )
      ),
      minWidth: double.infinity,
      height: 50,
      child: Center(
        child: CustomTextWidget(
          title,
          fontWeight: FontWeight.bold,
          textColor: context.appTheme.secondary,
        ),
      ),
    );
  }
}