import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Utilities/CategoryVM/category_view_model.dart';
import 'package:my_first_flutter_app/Utilities/Loaders/category_shimmer.dart';
import 'package:my_first_flutter_app/Utilities/Loaders/shimmer_effect.dart';
import 'package:my_first_flutter_app/Utilities/constants/colors.dart';
import 'package:my_first_flutter_app/Utilities/constants/enums.dart';
import 'package:my_first_flutter_app/Utilities/constants/image_strings.dart';
import 'package:my_first_flutter_app/Utilities/constants/shadows.dart';
import 'package:my_first_flutter_app/Utilities/device/device_utilities.dart';
import 'package:my_first_flutter_app/Utilities/helpers/helpers.dart';
import 'package:my_first_flutter_app/Utilities/constants/lang_english.dart';
import 'package:my_first_flutter_app/Utilities/constants/sizes.dart';
import 'package:my_first_flutter_app/common/widgets/app_bar.dart';
import 'package:my_first_flutter_app/features/Home/home_controller.dart';
import 'package:my_first_flutter_app/features/Onboarding/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../../Utilities/Repository/category_repository.dart';
import '../../common/styles/clipper_path.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = Helper.isDarkMode(context);

     final actionImages = [ActionImage(image: AssetImage(AppImages.homeCorousel1), onTap: () {},),
       ActionImage(image: AssetImage(AppImages.homeCorousel2), onTap: () {},),
       ActionImage(image: AssetImage(AppImages.homeCorousel3), onTap: () {},),];
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
             clipper: AppClipper(),
              child: AppBgContainer(dark: dark, height: 280,
                child: Container(
                    color: AppColors.primary,
                    child:  Column(
                      children: [
                        TitleWidget(
                          title:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:  CrossAxisAlignment.start,
                            children: [
                              Text(style: Theme.of(context).textTheme.labelLarge!.apply(color: AppColors.softGrey), 'Hello user'),
                              Text(style: Theme.of(context).textTheme.labelSmall!.apply(color: AppColors.grey), 'Welcome back to Shopeasy')
                            ],
                          ) ,
                          actions: [
                            ViewAddedItems(dark: dark),

                          ],
                        ),
                        const SizedBox(width: AppSizes.spaceBtwItems,),
                        const CommonSearchBar(primaryColor: AppColors.darkerGrey, backgroundColor: AppColors.softGrey, icon: Icons.search, placeholder: 'Search',),
                        const SizedBox(height: AppSizes.spaceBtwItems,),
                        const SectionHeader(title: "Categories", showBackArrow: false, textColor: AppColors.white,),
                        const SizedBox(width: AppSizes.spaceBtwItems,),
                        CategoriesList(dark: dark, count: 10, height: 100,)
                      ],
                    )
                ),

              ),
            ),
            CarouselSlides(urls: [AppImages.homeCorousel1, AppImages.homeCorousel2, AppImages.homeCorousel3],),
            const SizedBox(height: AppSizes.spaceBtwItems,),
            SectionHeader(title: "Products", showBackArrow: true, textColor: dark ? AppColors.grey : AppColors.black,),
            GridView.builder(
              itemCount: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSizes.gridViewSpacing,
                crossAxisSpacing: AppSizes.gridViewSpacing,
                mainAxisExtent: 250
            ), itemBuilder: (_, int index) => ProductCell(dark: dark),)

          ],
        ),
      )

    );
  }
}

class AppBgContainer extends StatelessWidget {
  const AppBgContainer({
    super.key,
    required this.dark, required this.child, required this.height,
  });
final double height;
  final bool dark;
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      color: Colors.transparent,
      child:
      SizedBox(
        height: height,
        child: Stack(
          children: [
            //right: - 50, top: -100 ,
            //right: - 70, top: -150 ,

            child,
            Positioned(top: - 150, right: - 250, child: CircularContainer(height:  200,  width: 200, backgroundColor: AppColors.white.withOpacity(1), padding: EdgeInsets.all(0),)),
            Positioned(top:  100,  right: - 300, child: CircularContainer(height:  200,  width: 200, backgroundColor: AppColors.white.withOpacity(1), padding: EdgeInsets.all(0),)),
          ],
        ),
      ),
    );
  }
}

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key, required this.height, required this.width, required this.backgroundColor, this.child, required this.padding,
  });

  final double height;
  final double width;
  final Color backgroundColor;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: width,
      width:  height,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor.withOpacity(0.5),
      ),
      child: child,
    );
  }
}

class ViewAddedItems extends StatelessWidget {
  const ViewAddedItems({
    super.key, required this.dark,
  });
  final bool dark;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart), color: dark ? AppColors.white : AppColors.dark,),
        Positioned(right: 0, child: Container(
          height: 18,
          width: 18,
          decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(100)
          ),
          child:  Align(
            alignment: Alignment.center,
            child: Text(style: Theme.of(context).textTheme.labelSmall!.apply(color: AppColors.white), '2') ,
          ),

        ))
      ],
    );
  }
}

class ProductCell extends StatelessWidget {
  const ProductCell({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceUtils.getScreenWidth(context) / 2.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        boxShadow: [AppShadows.horizontalBoxShadow],
        color: Helper.isDarkMode(context) ? AppColors.dark : AppColors.white,
      ),
      child:  Column(
        children: [
          RoundedContainer(
          height: 180,
          width: DeviceUtils.getScreenWidth(context) / 2.2,
          padding: const EdgeInsets.all(AppSizes.sm),
          backgroundColor: dark ? AppColors.dark : AppColors.white, margin: null,
          child: Stack(
            children: [
              ActionImage(image: AssetImage(AppImages.product1)),

              Positioned(top: 0, right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: dark ? AppColors.dark.withOpacity(0.8) :  AppColors.white.withOpacity(0.8),
                    ),
                    child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite, color: AppColors.error,)),
                  )

              ),
              Positioned(top: 12, left: 0,
                child:
                RoundedContainer(
                  radius: AppSizes.sm,
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                  backgroundColor: AppColors.warning.withOpacity(0.8),
                  child: Text(style: Theme.of(context).textTheme.labelSmall, '25%'),
                ),),

            ],

          ),
        ),
          Padding(padding: const EdgeInsets.only(left: AppSizes.sm),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(style: Theme.of(context).textTheme.labelSmall, 'Egg salad', textAlign: TextAlign.left, maxLines: 2, overflow: TextOverflow.ellipsis,),
              const BrandTitleWithVerifiedIcon(title: 'Non veg',),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(style: Theme.of(context).textTheme.labelSmall!.apply(color: AppColors.textSecondary), '\$135.00'),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(AppSizes.borderRadiusLg) , topLeft: Radius.circular(AppSizes.productImageRadius)),
                    ),
                    child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(style: Theme.of(context).textTheme.headlineMedium!.apply(color: AppColors.white), '+', textAlign: TextAlign.left, maxLines: 1, overflow: TextOverflow.ellipsis,),
                    )
                  )
                ],

              )
            ],
          ),
          )
        ],
      )


    );
  }
}

// class BrandTitleText extends StatelessWidget {
//   const BrandTitleText({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//                Text(style: Theme.of(context).textTheme.labelSmall!.apply(color: AppColors.textSecondary), 'Non veg'),
//               const SizedBox(
//               height: AppSizes.fontSizeSm,
//               width: AppSizes.fontSizeSm ,
//               child: Icon(Icons.verified_user_rounded, size: AppSizes.fontSizeSm,),
//             ),
//
//           ],
//         );
//   }
// }

class CarouselSlides extends StatelessWidget {


  const CarouselSlides({super.key, required this.urls});


  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(

      children: [
        CarouselSlider(
             options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.didPageChanged(index),
        ),
    items: urls.map((url) => ActionImage(image: AssetImage(url))).toList()),

       Obx(
           ()  => Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 for(int i = 0; i < urls.length; i ++)
                   Container(
                     margin: const EdgeInsets.only(right: 10),
                     height: 4,
                     width: 20,
                     decoration: BoxDecoration(
                         color: i == controller.selectedIndex.value ? AppColors.primary : Colors.grey,
                         borderRadius: BorderRadius.circular(10)
                     ),
                   )
               ]
           ),

       )



      ],
    );
  }
}

class ActionImage extends StatelessWidget {
  const ActionImage({
    super.key,
    required this.image,
     this.onTap,
  });

  final AssetImage image; // Use AssetImage directly
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),

          child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.md),
      color: Colors.transparent, // Ensure transparency for better layering
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(AppSizes.md),
    child: Image(
    image: image,
    fit: BoxFit.fill,
    ),
    ),
    ),
    ),
    );
    }
}

final viewModel = Get.put(CategoryVM());

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.dark, required this.count, required this.height,
  });

  final bool dark;
  final int count;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Obx( () =>
      SizedBox(
       height: height,
       child:
       ListView.builder(
           shrinkWrap: true,
           scrollDirection: Axis.horizontal,
           itemCount: viewModel.allCategories.length,

           itemBuilder: (context, int ) {
             final category = viewModel.allCategories[int];
             if (viewModel.isloading.value) return const TCategoryShimmer();

             return
               Padding(padding: const EdgeInsets.only(left:  AppSizes.spaceBtwItems),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Container(height: height / 2 ,
                     width:height / 2,
                     decoration: BoxDecoration(
                     color: dark? AppColors.dark : AppColors.softGrey,
                     borderRadius: BorderRadius.circular(height / 2),
                 ),
                       child:  Icon(Icons.fastfood_rounded, color:  dark? AppColors.primary : AppColors.black),),
                     SizedBox(
                       width: 56,
                       child:  Text(style: Theme.of(context).textTheme.titleSmall!.apply(color: AppColors.textWhite), textAlign: TextAlign.center, category.name, maxLines: 1, overflow: TextOverflow.ellipsis,),
                     )

                   ],
                 ),

               );

           }
       ),
                        ),

    );
}
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.title,  this.showBackArrow = false, this.callback, this.textColor = AppColors.white,  this.padding = const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });

  final String title;
  final bool showBackArrow;
  final VoidCallback? callback;
  final Color? textColor;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding,
    child:   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(style: Theme.of(context).textTheme.headlineSmall!.apply(color:  textColor), title),
        if (showBackArrow) TextButton(onPressed: callback, child: Text(style: Theme.of(context).textTheme.titleSmall!.apply(color:  textColor), 'more'))
      ],
    ),
    );
  }
}

class CommonSearchBar extends StatelessWidget {
  const CommonSearchBar({
    super.key, required this.primaryColor, required this.backgroundColor, required this.icon, required this.placeholder, this.padding = const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
  });
final Color primaryColor;
final Color  backgroundColor;
final IconData icon;
final String placeholder;
final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding,
      child: Container(
        width: DeviceUtils.getScreenWidth(context),

            padding: EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            border: Border.all(color: primaryColor)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: primaryColor,),
            const SizedBox(width: AppSizes.md,),
            Text(style: Theme.of(context).textTheme.labelMedium!.apply(color: primaryColor), placeholder)
          ],
        ),

      ),);
  }
}

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({super.key, this.child,  this.width,  this.height,  this.radius = AppSizes.cardRadiusLg,  this.borderColor = AppColors.borderPrimary,  this.backgroundColor = AppColors.white,  this.padding,  this.margin,  this.showBorder = false});


final Widget? child;
final double? width;
final double? height;
final double radius;
final Color borderColor;
final Color backgroundColor;
final EdgeInsetsGeometry? padding;
final EdgeInsetsGeometry? margin;
final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
color: backgroundColor,
        borderRadius:  BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child:  child,
    );
  }
}

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
  super.key,

  this.color,
  this.maxLines = 1,
  required this.title,
  this.textAlign = TextAlign.center,
  this.brandTextSize = TextSizes.small,
});

final Color? color;
final String title;
final int maxLines;
final TextAlign? textAlign;
final TextSizes brandTextSize;

@override
Widget build(BuildContext context) {
  return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow:
      TextOverflow.ellipsis,
      style:
  brandTextSize == TextSizes.small
  ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
      : brandTextSize == TextSizes.medium
  ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
      : brandTextSize == TextSizes.large
  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
      : Theme.of(context).textTheme.bodyMedium!.apply(color:
  color),
  );
}
}

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = AppColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;

  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
    Flexible(
    child:
    BrandTitleText(
     title: title,
      color: textColor,
      maxLines: maxLines,
      textAlign: textAlign,
      brandTextSize: brandTextSize,
    ),
    ),
    const SizedBox(width: AppSizes.xs),
    Icon(Icons.verified_user_outlined, color: iconColor, size: AppSizes.iconSm,),

    ],
    );
  }
}