import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photos_app/src/config/config.dart';
import 'package:photos_app/src/config/widgets/widget.dart';
import 'package:photos_app/src/core/routes/page_names.dart';
import 'package:photos_app/src/features/domain/entities/article_entity.dart';
import 'package:photos_app/src/features/presentation/logic/httpResponse/articles_bloc.dart';

import '../widgets/widgets.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  void initState() {
    context.read<ArticlesBloc>().add(GetArticlesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is ArticlesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ArticlesFailure) {
            return const Center(child: Text('Second State came'));
          }
          if (state is ArticlesSuccess) {
            List<ArticleEntity> articlesList = state.articles;
            return Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, top: 60),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LargeTextWidget(text: 'Discover'),
                    const SizedBox(height: 32),
                    Text(
                      "What’s new today".toUpperCase(),
                      style: AppTextStyle.f13w900,
                    ),
                    const SizedBox(height: 16),

                    // Scrolling images horizontal
                    ScrollHorizontalCard(images: articlesList),
                    const SizedBox(height: 48),
                    Text('Browse all'.toUpperCase(),
                        style: AppTextStyle.f13w900),

                    // Scrolling images vertical
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: MasonryGridView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: articlesList.length,
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final articles = articlesList[index];
                          final image = articles.urls?['small'];

                          return Padding(
                            padding: const EdgeInsets.all(2),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PageNames.openPhotoPage,
                                    arguments: image);
                              },
                              child: Image(
                                image: NetworkImage('$image'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 32),

                    // See More button
                    const SeeMoreButtonWidget(),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
