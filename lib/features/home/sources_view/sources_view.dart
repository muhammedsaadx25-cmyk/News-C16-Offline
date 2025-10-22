import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_offline/api/api_service.dart';
import 'package:news_app_offline/api/models/Sources_response/Source.dart'
    show Source;
import 'package:news_app_offline/core/colors_manager.dart';
import 'package:news_app_offline/features/home/sources_view/article.dart';
import 'package:news_app_offline/features/home/sources_view/articles_provider.dart';
import 'package:news_app_offline/features/home/sources_view/sources_provider.dart';
import 'package:news_app_offline/models/category_model.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.category});

  final CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesProvider sourcesProvider;
  late ArticlesProvider articlesProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();

  }

  void fetchData()async{
    sourcesProvider = SourcesProvider();
    articlesProvider = ArticlesProvider();
    await sourcesProvider.fetchSources(widget.category);
    articlesProvider.fetchArticles(sourcesProvider.sources[0]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

      ChangeNotifierProvider.value(value: sourcesProvider),
      ChangeNotifierProvider.value(value: articlesProvider),

    ], child: Column(
      children: [
        Consumer<SourcesProvider>(
          builder: (context, sourcesProvider, child) {
            if(sourcesProvider.isLoading){
               return Center( child: CircularProgressIndicator(),);
            }
            return DefaultTabController(
              length: sourcesProvider.sources.length,
              child: TabBar(
                onTap: (index){
                  articlesProvider.fetchArticles(sourcesProvider.sources[index]);
                },
                isScrollable: true,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                labelStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.white,
                  fontSize: 16.sp,
                ),
                unselectedLabelStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.white,
                  fontSize: 14.sp,
                ),
                tabs: sourcesProvider.sources
                    .map((source) => Tab(text: source.name))
                    .toList(),
              ),
            );
          },
        ),

        Consumer<ArticlesProvider>(
            builder: (context, articlesProvider, child) {
              return Expanded(child: articlesProvider.isLoading ? Center( child: CircularProgressIndicator(),):

              ListView.separated(
                  itemBuilder: (context, index) =>
                      ArticleItem(article: articlesProvider.articles[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 16,),
                  itemCount: articlesProvider.articles.length));
            })
      ],
    ),);
  }
}
