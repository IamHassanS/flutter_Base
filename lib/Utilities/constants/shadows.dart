
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Utilities/constants/colors.dart';
class AppShadows{

  static final verticalBoxShadow = BoxShadow(
    color : AppColors.darkerGrey.withOpacity(0.1),
    offset : const Offset(0, 2),
    blurRadius : 50,
      spreadRadius : 7
  );

  static final horizontalBoxShadow = BoxShadow(
      color : AppColors.darkerGrey.withOpacity(0.1),
      offset : const Offset(0, 2),
      blurRadius : 50,
      spreadRadius : 7
  );

}