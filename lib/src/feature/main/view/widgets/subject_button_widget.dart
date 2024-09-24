import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/widgets/text_widget.dart';

class CustomSubjectButton extends StatelessWidget {
  const CustomSubjectButton({super.key, this.onPressed, required this.title, this.imageName});

  final VoidCallback? onPressed;
  final String title;
  final String? imageName;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: context.appTheme.onSecondary, width: 2)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextWidget(title, textColor: context.appTheme.secondary, fontSize: 24, fontWeight: FontWeight.w600),
              const SizedBox(width: 15),
              imageName != null ?
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imageName ?? "assets/images/x-image.png"),
                  ),
                ),
              ) : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}