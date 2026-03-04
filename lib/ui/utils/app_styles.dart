import 'dart:ui';

import 'package:movies_app/ui/utils/app_colors.dart';

abstract final class AppTextStyles {
  TextStyle white24Bold = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
  TextStyle white20Bold = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 20,
  );
  TextStyle white16Regular = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  TextStyle white20Regular = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
  TextStyle yellow14Regular = TextStyle(
    color: AppColors.yellow,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  TextStyle yellow14_900 = TextStyle(
    color: AppColors.yellow,
    fontWeight: FontWeight.w900,
    fontSize: 14,
  );
  TextStyle yellow15Regular = TextStyle(
    color: AppColors.yellow,
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );
  TextStyle yellow16Regular = TextStyle(
    color: AppColors.yellow,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  TextStyle black16Regular = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  TextStyle black20Regular = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
  TextStyle black20SemiBold = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  TextStyle yellow20SemiBold = TextStyle(
    color: AppColors.yellow,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
}
