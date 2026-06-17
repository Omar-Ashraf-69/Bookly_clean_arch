import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';

abstract class AppStyles {
   static final TextStyle  montserratBold20 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    fontFamily: kMontserrat,
  );
  static final TextStyle  montserratSemiBold14 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    fontFamily: kMontserrat,
  );
  static final montserratSemiBold18 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    fontFamily: kMontserrat,
  );
  static final montserratMedium14 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    fontFamily: kMontserrat,
  );
  static final montserratMedium16 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    fontFamily: kMontserrat,
  );
  static final montserratMedium18 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    fontFamily: kMontserrat,
  );
  static final montserratRegular14 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    fontFamily: kMontserrat,
  );
  static final interRegular30 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 30.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static final interRegular16 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
  static final interRegular20 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
}
