

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AnimatedSplashViewTextWidget extends StatelessWidget {
  const AnimatedSplashViewTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: AlignmentGeometry.center,
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 24.sp, fontFamily: 'Agne'),
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            animatedTexts: [
              TypewriterAnimatedText(
                "Read free books",
                speed: Duration(milliseconds: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

