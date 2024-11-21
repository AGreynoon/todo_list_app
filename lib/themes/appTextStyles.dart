import 'package:flutter/material.dart';
import 'package:todo_list_app/themes/appColors.dart';

class AppTextStyles {
  static const TextStyle pageTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Jost',
    color: AppColors.labelColor,
  );

  static const TextStyle buttonLargeLabel = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Jost',
    color: AppColors.labelColor,
  );

  static const TextStyle buttonSmallLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Jost',
    color: AppColors.labelColor,
  );

  static const TextStyle navigationBarLabel = TextStyle(
    fontSize: 12,
    fontFamily: 'Jost',
    color: AppColors.labelColor,
  );
  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontFamily: 'Jost',
    color: AppColors.titleToDoFontColor,
  );
  static const TextStyle details = TextStyle(
    fontSize: 12,
    fontFamily: 'Jost',
    color: AppColors.detailToDoFontColor,
  );
}
