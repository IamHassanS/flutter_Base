import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Utilities/constants/colors.dart';
import 'package:my_first_flutter_app/Utilities/device/device_utilities.dart';
import 'package:my_first_flutter_app/Utilities/helpers/helpers.dart';
import 'package:my_first_flutter_app/common/styles/clipper_path.dart';
import 'package:my_first_flutter_app/common/widgets/app_bar.dart';
import 'package:my_first_flutter_app/features/Home/home_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = Helper.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(
          children: <Widget>[
          ClipPath(
          clipper: AppClipper(),
          child: AppBgContainer(dark: dark,  height: 400, child:
          Container(
            color: AppColors.primary,

              child:
              TitleWidget(title: Text(style: Theme.of(context).textTheme.titleMedium!.apply(color: AppColors.white), 'Profile'))
          )
          )
          ),
      ],
      ),
    ),
    );
  }
}
