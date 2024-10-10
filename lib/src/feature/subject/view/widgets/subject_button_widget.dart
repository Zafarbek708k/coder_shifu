import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/widgets/scroll_text_widget.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/widgets/shimmer_text_widget.dart';

class CustomSubjectButton extends StatelessWidget {
  const CustomSubjectButton({
    super.key,
    this.onPressed,
    required this.title,
    this.imageName,
    this.size,
  });

  final VoidCallback? onPressed;
  final String title;
  final String? imageName;
  final double? size;

  @override
  Widget build(BuildContext context) {
    // Check if the title length is greater than 20
    bool isLongTitle = title.length > 20;

    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: context.appTheme.onSecondary, width: 2),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Use ConstrainedBox only if the title is long
              if (isLongTitle)
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 120),
                    child: TextScroll(
                      "$title   ",
                      mode: TextScrollMode.bouncing,
                      numberOfReps: 200,
                      delayBefore: const Duration(milliseconds: 2000),
                      pauseBetween: const Duration(milliseconds: 900),
                      velocity: const Velocity(pixelsPerSecond: Offset(100, 0)),
                      style: const TextStyle(decoration: TextDecoration.underline),
                      textAlign: TextAlign.right,
                    ),
                  ),
                )
              else
                ShimmerTextWidget(
                  title,
                  textColor: context.appTheme.secondary,
                  fontSize: size ?? 24,
                  fontWeight: FontWeight.w600,
                  shimmerBaseColor: context.appTheme.secondary,
                ),
              const SizedBox(width: 20),
              imageName != null
                  ? Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(imageName ?? "assets/images/x-image.png"),
                          fit: BoxFit.cover, // Ensures the image fits within the circle
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
