import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_offline/core/colors_manager.dart';
import 'package:news_app_offline/features/home/categories_view/category_item.dart';
import 'package:news_app_offline/models/category_model.dart' show CategoryModel;
import 'package:news_app_offline/providers/home_provider.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, });

  //final void Function(CategoryModel) onCategoryItemClicked;

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Column(
      children: [
        Text(
          "Good Morning\nHere is Some News For You",
          style: GoogleFonts.inter(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.white,
          ),
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                homeProvider.goToSourcesView(CategoryModel.categories[index]);
              },
              child: CategoryItem(category: CategoryModel.categories[index]),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: CategoryModel.categories.length,
          ),
        ),
      ],
    );
  }
}
