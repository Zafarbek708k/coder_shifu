import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/widgets/shimmer_text_widget.dart';
import '../../../../core/widgets/text_widget.dart';

// class CustomSubjectButton extends StatelessWidget {
//   const CustomSubjectButton({super.key, this.onPressed, required this.title, this.imageName, this.size});
//
//   final VoidCallback? onPressed;
//   final String title;
//   final String? imageName;
//   final double? size;
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoButton(
//       onPressed: onPressed,
//       child: Container(
//         height: 60,
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(horizontal: 25),
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: context.appTheme.onSecondary, width: 2)),
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               CustomTextWidget(title, textColor: context.appTheme.secondary, fontSize: size ?? 24, fontWeight: FontWeight.w600),
//               const SizedBox(width: 15),
//               imageName != null ?
//               Container(
//                 height: 45,
//                 width: 45,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: AssetImage(imageName ?? "assets/images/x-image.png"),
//                   ),
//                 ),
//               ) : const SizedBox.shrink()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSubjectButton extends StatefulWidget {
  const CustomSubjectButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.imageName,
    this.size,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String title;
  final String? imageName;
  final double? size;

  @override
  _CustomSubjectButtonState createState() => _CustomSubjectButtonState();
}

class _CustomSubjectButtonState extends State<CustomSubjectButton> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 5), // Adjust duration as needed
      vsync: this,
    );

    // Define the scrolling animation
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    // Start the animation if the text length exceeds 20 characters
    if (widget.title.length > 20) {
      _animationController.repeat(reverse: false); // Continuous animation
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double _getTextWidth(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(fontSize: widget.size == null ? 22 : widget.title.length < 20 ? widget.size : widget.size! - 5, fontWeight: FontWeight.w600),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    double textWidth = _getTextWidth(widget.title);
    double containerWidth = MediaQuery.of(context).size.width * 0.6; // Adjust the container width as needed

    return CupertinoButton(
      onPressed: widget.onPressed,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary, width: 2),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  // Translate the text horizontally if it's too long
                  return Transform.translate(
                    offset: Offset(
                      widget.title.length > 20 ? -(textWidth - containerWidth) * _animation.value : 0,
                      0,
                    ),
                    child: SizedBox(
                      width: textWidth,
                      child: ShimmerTextWidget(
                        widget.title,
                        textColor: context.appTheme.secondary,
                        fontSize: widget.size ?? 24,
                        fontWeight: FontWeight.w400,
                        shimmerBaseColor: context.appTheme.secondary,
                        // style: TextStyle(
                        //   color: Theme.of(context).colorScheme.secondary,
                        //   fontSize: widget.size ?? 24,
                        //   fontWeight: FontWeight.w600,
                        // ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 15),
              widget.imageName != null
                  ? Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(widget.imageName ?? "assets/images/x-image.png"),
                          fit: BoxFit.cover,
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
