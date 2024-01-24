import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/src/config/config.dart';
import 'package:photos_app/src/config/widgets/widget.dart';
import 'package:photos_app/src/features/domain/entities/article_entity.dart';
import 'package:photos_app/src/features/presentation/logic/httpResponse/articles_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context.read<ArticlesBloc>().add(GetArticlesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 60),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LargeTextWidget(text: 'Search'),
              const SizedBox(height: 32),
              const TextFieldWidget(
                hintText: 'Search all photos',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 32),
              Text(
                'All Results'.toUpperCase(),
                style: AppTextStyle.f13w900cBlack,
              ),
              const SizedBox(height: 16),
              BlocBuilder<ArticlesBloc, ArticlesState>(
                builder: (context, state) {
                  if (state is ArticlesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ArticlesFailure) {
                    return const Center(child: Text('Second State came'));
                  }
                  if (state is ArticlesSuccess) {
                    List<ArticleEntity> articlesList = state.articles;
                    return SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 0),
                        itemCount: articlesList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          final articles = articlesList[index];
                          final image = articles.urls?['small'];
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              width: 107,
                              height: 107,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage('$image'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
