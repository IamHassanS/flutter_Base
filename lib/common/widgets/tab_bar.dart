import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Utilities/constants/colors.dart';
import 'package:my_first_flutter_app/Utilities/device/device_utilities.dart';

class AppTabbar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabbar({super.key, required this.dark, required this.title});
final bool dark;
final List<Widget> title;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index){

      },
      tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: AppColors.primary,
        labelColor: dark ? AppColors.grey : AppColors.dark,
        unselectedLabelColor: AppColors.darkerGrey,
        tabs:  title,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
