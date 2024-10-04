import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Utilities/constants/colors.dart';
import 'package:my_first_flutter_app/Utilities/constants/enums.dart';
import 'package:my_first_flutter_app/Utilities/constants/image_strings.dart';
import 'package:my_first_flutter_app/Utilities/constants/sizes.dart';
import 'package:my_first_flutter_app/Utilities/helpers/helpers.dart';
import 'package:my_first_flutter_app/common/widgets/tab_bar.dart';
import '../../common/widgets/app_bar.dart';
import 'package:my_first_flutter_app/features/Home/home_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {


    final dark = Helper.isDarkMode(context);
    return DefaultTabController(
      
      length: 5,
      child: Scaffold(
        appBar: TitleWidget(
          title: Text(style: Theme.of(context).textTheme.headlineMedium,  'Store'),
          actions: [
            ViewAddedItems(dark: dark,)
          ],
        ),
      
        body: NestedScrollView(headerSliverBuilder: (_, isExtended) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              elevation: 0,
              backgroundColor: dark ? AppColors.dark : AppColors.white,
              automaticallyImplyLeading: false,
                expandedHeight : 360,
              flexibleSpace: Padding(padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: ListView(
                  shrinkWrap: true,
                  physics:  NeverScrollableScrollPhysics(),
                children: [
                  CommonSearchBar(primaryColor: AppColors.grey, backgroundColor: dark ? AppColors.dark : AppColors.white, icon: Icons.search, placeholder: 'Search in store', padding: EdgeInsets.zero),
                  const SizedBox(height: AppSizes.sm,),
                  SectionHeader(title: "Popular stores", showBackArrow: true, textColor: dark ? AppColors.grey : AppColors.dark, padding: EdgeInsets.zero,),
      
                  GridView.builder(
                    scrollDirection: Axis.vertical,
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppSizes.gridViewSpacing,
                          crossAxisSpacing: AppSizes.gridViewSpacing,
                          mainAxisExtent: 80
                      ), itemBuilder: (_, index) {
                        return  CategoriesView(dark: dark, showBorder: true,);
                      }),
      
      
                ],
      
              ),
              ),
              bottom: TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicatorColor: AppColors.primary,
                labelColor: dark ? AppColors.grey : AppColors.dark,
                unselectedLabelColor: AppColors.darkerGrey,
                tabs:  [Text('Fast foods'), Text('Snacks'), Text('Spices'), Text('Nuts'), Text('Cereals')],
              ),


            //  AppTabbar(dark: dark, title:
             //   const [Text('Fast foods'), Text('Snacks'), Text('Spices'), Text('Nuts'), Text('Cereals')]
             // ,),
            )
          ];
        } , 
            
      
            body: TabBarView(
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ///Brands
                      Padding(padding: const EdgeInsets.all(AppSizes.defaultSpace),
                        child:
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            RoundedContainer(
                                showBorder: true,
                                backgroundColor:  dark ? AppColors.dark : AppColors.white,
                                borderColor: AppColors.borderPrimary,
                                child: Column(
                                  children: [
                                    CategoriesView(dark: dark, showBorder: false,),
                                    SizedBox(height: AppSizes.sm,),
                                    Row(
                                      children: [
                                        for (var image in [AssetImage(AppImages.product1), AssetImage(AppImages.product1), AssetImage(AppImages.product1)])
                                          Expanded(
                                            child: RoundedContainer(
                                              backgroundColor: dark ? AppColors.dark : AppColors.white,
                                              child: Image(image: image, height: 100, width: 50, fit: BoxFit.contain,),
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                )


                            ),
                          ],
                        ),

                      ),
                      Padding(padding: const EdgeInsets.all(AppSizes.defaultSpace),
                        child:
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            RoundedContainer(
                                showBorder: true,
                                backgroundColor:  dark ? AppColors.dark : AppColors.white,
                                borderColor: AppColors.borderPrimary,
                                child: Column(
                                  children: [
                                    CategoriesView(dark: dark, showBorder: false,),
                                    SizedBox(height: AppSizes.sm,),
                                    Row(
                                      children: [
                                        for (var image in [AssetImage(AppImages.product1), AssetImage(AppImages.product1), AssetImage(AppImages.product1)])
                                          Expanded(
                                            child: RoundedContainer(
                                              backgroundColor: dark ? AppColors.dark : AppColors.white,
                                              child: Image(image: image, height: 100, width: 50, fit: BoxFit.contain,),
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                )


                            ),
                          ],
                        ),

                      ),
                      ///Products
                      SectionHeader(title: "You might also like", showBackArrow: false, textColor: dark ? AppColors.grey : AppColors.dark, padding: EdgeInsets.zero,),
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

                  )

],
            ),
            )
        ),
      );
  }
}


//
class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
    required this.dark, required this.showBorder,
  });

  final bool dark;
final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return  RoundedContainer(
        showBorder: showBorder,
        backgroundColor:  dark ? AppColors.dark : AppColors.white,
        borderColor: AppColors.borderPrimary,
        child:Padding(padding: EdgeInsets.all(AppSizes.sm),
            child:  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            //height: 30,
            width: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color:  dark ? AppColors.dark : AppColors.white
            ),
            child: Align( alignment: Alignment.center,
                child: Icon(Icons.fastfood, color: dark ? AppColors.grey : AppColors.darkerGrey, size: 20,)),
          ),
        ),

        SizedBox(width: AppSizes.md,),
        const Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              BrandTitleWithVerifiedIcon(title: 'Burgers',brandTextSize: TextSizes.medium),
              BrandTitleText(title: '50+ items', brandTextSize: TextSizes.small)
            ],
          ),
        )
      ],
    ),
        ),
    );


  }
}


// GridView.builder(
// itemCount: 8,
// shrinkWrap: true,
// physics: const NeverScrollableScrollPhysics(),
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// mainAxisSpacing: AppSizes.gridViewSpacing,
// crossAxisSpacing: AppSizes.gridViewSpacing,
// mainAxisExtent: 250
// ), itemBuilder: (_, int index) => ProductCell(dark: dark),)

