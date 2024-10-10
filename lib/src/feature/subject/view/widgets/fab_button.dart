import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/shimmer_text_widget.dart';

class FABWidget extends StatelessWidget {
  const FABWidget({super.key, this.onPressed, required this.title, this.imageName});

  final VoidCallback? onPressed;
  final String title;
  final String? imageName;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        margin: REdgeInsets.all(5),
        height: 60.h,
        width: 130.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: context.appTheme.onSecondary, width: 2),
            color: context.appTheme.primaryContainer,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: ShimmerTextWidget(
                  title,
                  shimmerBaseColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 55,
                  // width: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imageName ?? "assets/images/x-image.png"),
                      fit: BoxFit.contain, // Ensures the image fits within the circle
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
