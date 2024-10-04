import 'dart:ffi' show Bool;
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Utilities/constants/sizes.dart';
import 'package:my_first_flutter_app/Utilities/device/device_utilities.dart';
import 'package:get/get.dart';

class TitleWidget extends StatelessWidget implements PreferredSizeWidget {
  const TitleWidget({
    Key? key,
    this.title,
    this.leadingIcon,
    this.leadingIconPressed,
    this.actions,
    this.showBackArrow = false,
  }) : super(key: key);

  final Widget? title;
  final IconData? leadingIcon;
  final VoidCallback? leadingIconPressed;
  final List<Widget>? actions;
  final bool showBackArrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
      child: AppBar(
          automaticallyImplyLeading: false,
          leading: showBackArrow
              ? IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_left))
              : leadingIcon != null
              ? IconButton(onPressed: leadingIconPressed,
              icon: Icon(leadingIcon))
          : null,
      title: title != null ? title : null,
      actions: actions,
    ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}



